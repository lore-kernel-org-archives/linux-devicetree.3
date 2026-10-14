Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9049F47F786
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 08:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791967112; cv=none; b=A8W/vwwoBr6jlAUk/I2tXrt3M4qOURU3Mrqr1sF4SINXzdfPehdXBoOQfeTi0sq/+qagoLC2CBe0tnmJHs/hp1hHN0RvtA4fhix7rS9PNGT4/bpVwe1Gq/bNGf1qGwLcZE7GTWYCqOrps6jdNvPVfVNcYn5c3B47r9L681JmYnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791967112; c=relaxed/simple;
	bh=JNgT2oTJIx5xBbDHq0D6uqDXAg/tmRWNO5zxHKbbGho=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bXVejfXo3aZk2RkYcuFpsl00CRYrst0ZQb98pLXivJYMFaxgcagL29yX/w6fAYJpMpw7YP2yLjev2B/mCy8KnAVlE2TMhEYhexyXoSpEXq4RWS4f16lJnh4wokyFDUHJ0XgCopPQhOLkYJjnSwOr2e6EMzCvG49zUxKIFjqI2Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QohxCooC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XVQ/Bz4N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QohxCooC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XVQ/Bz4N"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E663A93365335
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 08:38:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=1LlVoM17gyVNWqPXIo4RA/hbsGE8lLUrd+S
	szrYIGjA=; b=QohxCooCXCApvMT6vrem0LVAMvV6pgcvyqvFWEwYYpET3Msi5Wn
	01PPKdHKNEEXb+HWm/y1N1QDXaTQ4jux70ZEY5HY3599uixAC38ft5UFjnwI5UO7
	8eHdwC9cbKf5sAwzw6PTiTwYPOjOzhTK/2yRS7LUib2+ZCQZHXPPSSeiI80a5YUI
	oDBdgp/Pamq9DyeHJlFZatDsH2JgsUXOdpULDdGJIxRySqV4jjBYGo2pBTc5h59m
	rNGK5CAcrQc3jUTXUMtQmAWemDtzlZNHOHCw5Ecs3bjIiGlTZ11IORLvH9JfXHfA
	724L0e/D17pgm+Zs7x1Zwk/rKDM7R1d0EPA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha4620knj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 08:38:30 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39512608fb1so236989a91.1
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 01:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791967109; x=1792571909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1LlVoM17gyVNWqPXIo4RA/hbsGE8lLUrd+SszrYIGjA=;
        b=XVQ/Bz4NMWYMue0PIIi4QHsxAY8o0zxOA0E3IIplbiQesnhyKlVeCGldKNl8V37ulF
         my0KW8GSg5MEC+vUtqWf68g2PBO2uS0d+GuQy/pCNeiOrdbgJMaBTAOLuHESh5v9frLa
         zwwXn96+yhm+SJs6yvibb3o6MU9UdyRkUnse4HeZj1Uxu5c+2JXRhjOmoARvE0rOg4Hb
         fWVjUlfS9WO1OgBRcyvJ/KG6loasAyoEwD/C2pI9Mdh1d5TIR8pomCD0DP01Hc9zF6fC
         O7K88l7YHRtNCa64J7RAst3+IHJPDgxtA0yybUX/4HsvglwOwm0QzfIfRLmOFUlPvBb9
         Fq9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791967109; x=1792571909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1LlVoM17gyVNWqPXIo4RA/hbsGE8lLUrd+SszrYIGjA=;
        b=VEIh6CO/Eda1+143Laan4Lgwx78l29arXHUZ1zUqnMDPP9KPXqBEJvq4+JZ5To6u6+
         lPj+GHBMJnp0GHp5NoHtYyOhy1VVQW3gZ0w+Es7p7qfuSOjYOSrUirUblgRQTCFTXHwi
         /y8vDWdHR8LQJvxR839P8YhgFw/z88toCRXeh32S+58evY0dhDKlkAkN3Doz0uKC+aFR
         DPKt+GWjwGZkiuS6SFNacs/mKBdIE36DUd7NP5lwlZpYcBEk1tb0HeYN9TfnPrQZylEx
         ++grW3GeSi0sz+jddsAxVDk8PAIgIvevtPWEvPdjzMPvuGwrnJB8Ik4588YdRq13KTYa
         rcMg==
X-Forwarded-Encrypted: i=1; AKwUvBwWlhUrScIVMsMKRUHyY+hGyF40W6oO91refzUdRnCp5nVVm917WZohQ37gKcr1yO0s738x1XaH7ySu@vger.kernel.org
X-Gm-Message-State: AFq9FYLAwKdTx1l8wf/Hj2PzGrH+lfnoSXLorLoflfknm4mElrGuh6kY
	UtoJhrb3SAwxdCJKc1eA8MYxPw9412DgW84qthl+5uiYBsHwaRceVBC4nQQFTvqUiluPCXXWfVw
	yExQ8sn6cu3BNCExi2zDXJyXxjRiYxDkn47+H8WfphekarEJjEi8r+3RpgmryG4k4
X-Gm-Gg: AYBFou0vhfwdZRvieKJpwroH5+24f0Pq0AUBbaQDQk9rVi6xsnfvxDFNYUilv0f5ek3
	sXAzg+tCVgucNi+LHFONuvLD37W0t/fFZ8frmT+A7lQdd7LjDKK96RQxKIbV2ihZTZkQcoXoH0c
	IIdXDmwZ6uoi1chOmybn01PDfQUeOyhdnJmY4LRTzMN+UoStftw7X0hmu4uJMoZmI2EZukumZR4
	QOB033mH7Va5jt6EhhYCL9tYHCOcLGf/MaslqQ/IWvI5ziXou9aOcOc1DO46aCiC1/Vm21L8hIh
	Ne9B5N5s5HZWdzIvYz6q5pCSwhXntam0DZGvQxEwhmG9Gy4Du6TsHDUrxjwxWwtUsp1xsolc13u
	xv2knKXzFL45RxhIV/y0CYezGUdWuIk1pCSSUDFyYyC77mpF9wGGgvT+AoVe3sGA4DwD+T20=
X-Received: by 2002:a17:90b:224c:b0:3a8:bbc2:5551 with SMTP id 98e67ed59e1d1-3ab3a0f0a1dmr14977937a91.0.1791967108773;
        Wed, 14 Oct 2026 01:38:28 -0700 (PDT)
X-Received: by 2002:a17:90b:224c:b0:3a8:bbc2:5551 with SMTP id 98e67ed59e1d1-3ab3a0f0a1dmr14977874a91.0.1791967107132;
        Wed, 14 Oct 2026 01:38:27 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac752d590csm1724804a91.2.2026.10.14.01.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 01:38:26 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Jianping Li <jianping.li@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ekansh.gupta@oss.qualcomm.com, quic_chennak@quicinc.com
Subject: [PATCH v1] arm64: dts: qcom: talos: Make the ADSP remote heap no-map
Date: Wed, 14 Oct 2026 16:38:20 +0800
Message-Id: <20261014083820.468-1-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Jq8r3cL5usQ0JDMLToLBLi7_Ioxpf19Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzNCBTYWx0ZWRfXzekw0z66I1eE
 k6Tgu49KL2PchV/rETT58A7af880x/a6HV+fB6JvA5UkmJLcMouhJvBZRWFBu5uXGUCOnKt8jTt
 yoIR5q3EtP/iTHVUsnpA22CdA8z6W5EJZEWBSBz3SN6wBvUOhjNxyzUpwiNke4j5UlAMK6qNFi/
 D9+OAaU6J8tN9hFxONlVMKznum/DBHvTyGOez2jaRaf1s1+hwwXZLM9Nx98WdMDGB/t9X0oLB5u
 cLdWuZQe4dvsajmKLgd7Zo7fHl83YnO5LMVQGt3ixJiOHBDnhjVG3Mk8DTAPdmjo+97SBC8ZuAq
 fpAld/Mf+8EfAcKBfWixNdLhZ6CQe9Y2EJfoUTNg8PQu0kVQqidLXw/oHea94A8L9BQqI+CrviM
 /jVJldMQDuSnXJnoidHZnvugVWlyZTJz3SXnAPeZG7Lpu3EsaKbKkI4UXkDc3yodWZaPHyj10vv
 tqTDk5+f0dbjWLhWvwQ==
X-Authority-Analysis: v=2.4 cv=ErZHPicA c=1 sm=1 tr=0 ts=6acf3f86 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=lhXw38L0c4fPFhUHQqIA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzNCBTYWx0ZWRfX9y/1lZXsZ3AJ
 CfnTP1jWesyJBnq7+EJMbjkYFZSfj2B8lF7qAuX1XYxFpeokvMgiCbImr7+j+Hj5YpuCPnZPf6H
 CraplWve3kFfW5ZsX1E58+rMrHnLBjU=
X-Proofpoint-GUID: Jq8r3cL5usQ0JDMLToLBLi7_Ioxpf19Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1011 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140034

The ADSP remote heap is declared as a reusable CMA pool. FastRPC
assigns the entire region to the DSP through qcom_scm_assign_mem()
during probe without allocating the pages from CMA. Consequently,
the pages remain available for movable HLOS allocations even after
HLOS access to the region has been revoked.

On Talos, GPU stress testing triggers a synchronous external abort
when zram accesses pages within the ADSP remote heap.

Replace reusable with no-map to prevent the region from being reused
for normal kernel allocations and exclude it from the kernel's
standard memory mapping.

Fixes: b0b51a5f1911f ("arm64: dts: qcom: talos: Add memory-region for audio PD")
Link: https://lore.kernel.org/all/20260424-talosaudio-v3-1-9e2ad5d78a2e@oss.qualcomm.com/
Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 8ed6f2755705..b14952b57d6a 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -682,7 +682,7 @@ pil_gpu_mem: pil-gpu@97715000 {
 		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
 			compatible = "shared-dma-pool";
 			alloc-ranges = <0x0 0x80000000 0x0 0x80000000>;
-			reusable;
+			no-map;
 			alignment = <0x0 0x400000>;
 			size = <0x0 0x800000>;
 		};
-- 
2.43.0

