Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD89E30AAD8
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369241; cv=none; b=IffgFBMD4sec0cRrgDTpw0KiPbV3GEKhHpGtCgTEUQBJNwZTVfTLX6avvx2FLTktRdxMlvxNHgtR/CUeqmsAw6iBs2X5pxow/mtgkvxzpaqHHaqXDlNM2EOt4/RvgbPORzzVnS6tiUj7Jcp57V0+IUu1nfd+piNbrqKtRbb3ZvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369241; c=relaxed/simple;
	bh=GLka7GcVE6RBS400scitvlbiRMjZgwnnJ4v6VFdq9FU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GvOXd3C6KIyZ6huITCn8sWja55yrgNtyc2y0fh2GJ7D5Nta23mKi94qDK+qFIUxHMaTXVyFngacyt2CKoMkpNHsekTeuEVMYnycamVVvJOGkScCG78Fb31MTVzooj3g7EIxsxM9p+G/w7uCTQNvbE8da36gzzkr6PjNGryR/1DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bPi9ZkXT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HZHkL68k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bPi9ZkXT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HZHkL68k"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5inNe4057536
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:00:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QUD5eH4UI3ASYO4AhQ8fRl58MTKoG81MecnLqAS7CVc=; b=bPi9ZkXTbZQMfsv1
	F8fMb78IMSZAB3KngjDVhuxhNQprRcwWkt3Fld3XB1f6/P9Ugrs/7BI9eZHXjsRj
	Qi6LL7MSv/uCZhrQRMzNWYAl0IiiFJU0oT8Vr1L83DR70hFIk854dRieN2LNLHIQ
	QvJ2DTL+Hk/KUvNfmfYnOdwGQCacHcJX9YW+jt2XdrUL6arxPFLXms7thXdzOvTx
	UYBewbL8kW18f68j+K3s4ztFuOjqRkFJoDMPPyIcaWvQGrpz8YbzJ1KnywjviVhQ
	olgXo6PAou6v720BHMDRcQThcLGkFcG2JFKBzCohq+AzEBPS+ao22r+n7c1tLLaY
	NraxEA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hss7wk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:00:38 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbedbd182f5so2331751a12.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789369238; x=1789974038; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QUD5eH4UI3ASYO4AhQ8fRl58MTKoG81MecnLqAS7CVc=;
        b=HZHkL68kj/wD6v1nZc6cXKG8BLISccvNPOfvQH6e+/sxmBoOk7A8yTPuBMxdsW9XjS
         lO1na4z64YmNTOApUtoagsARBfOwvYOanL88ClmJsDFV82ONj+dUdCGO1p2kVQZ9ZyMs
         TyELdJeLJ4Z6JpsU1+1/90X7vDTQ/yln0sDPvPrh+cZRoK3rqHTWBRgReTv6qUPCP/0B
         TN042uxk3Ke4SPcMtZXfYPP2wlTa02napZLenj9VO5jD76Jnz4SyzEP1V7jRIQhVU526
         Bm3LyMfFQGaGxHmfpxnOLkGSV+YYS8yT+6RGs6iy+wJHHmxI3p+vzHg4OR1DbUDSszDa
         WS2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369238; x=1789974038;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QUD5eH4UI3ASYO4AhQ8fRl58MTKoG81MecnLqAS7CVc=;
        b=Px6PVAF1VmlBlA2DV/fOEdO/5VyY/9KKY9ZNoDOMvZWiOOOJY/AepSiNAd5xMycjxm
         rsSEV3loCkV3ZUYZOZ7CBwFhjkrhQ8Lz8xDMroc9dsXqILuzxDZrNTkM+r2TbkeYMrsC
         DLxuVd2QnZygRq8FR7YBphcWtdSFqKIrJxGeNZQRan7XZVWl0It7bwd9LEUXWBHx2MTa
         yc0djnoZiG2L4x4HIvHHfdmJ/oOm/0ab7XNQ5vDBBtfTCzzBWOtzPvpkkwJt3GU9Pxeb
         poJGgtrmrPEDamJ/XI/8MxRdqo59/EnQ6NwP7F7XHVfVC6zghs0Xm7jLhAMsndSFA+rz
         mooQ==
X-Forwarded-Encrypted: i=1; AKwUvBzmezzPL8BuLHVbMrNZfWMrhFDUThAt9kA6NAoUOS/bje4ukoWrPp6oD5YBIDPwAzMV4CNXvSdf9giO@vger.kernel.org
X-Gm-Message-State: AFuF++m+3Vg3OXAu5jXB8NZFXmQOPv7PuNRoTfkicms9lDa+JEky0LVN
	FO/5XIRiX3p24phtFXk3JND2EDeISLT1odu2GacB2oz+TbGSObCtQp21x2WbcAZA96dhDjL0UfO
	1ZuFQPWguPoBXvMJwlgQJqQ6NSKzH848qjgLNamVthLvHy2iijK19ewDL6yMdpB2f
X-Gm-Gg: AYBFou2UxcbDAaJVPYZpNWNhVEX4AJy0+2sOHNJHQpJQu/g7Yg2MmH821AsnXTruagc
	edeWMwlYLeq32G9HiZ7jSBrwvfdk3iHrppXtallGoZOnewujV8927DAjmHs8dtiHfTgNDAhi+Un
	zhNu7+ZBkUBJt6RVwbjBciAonmIskIC9EXYewyU57EHELR7R3tKNcIMQR9VQwQhl/yUySP2ctv7
	eeToJSdQxiEMdcSViuFB9vG+v8cg4eDGQ6pF4fF6D0vacWrWOojYsi22RAozzeMY0E+ZmO16ibQ
	4AuyWHf6Mt8+BYvdKrnjbJtoQXL/GJMQg3E72s3YClkD+CpKv+7McpykewcSlt55zPp/stIjD7C
	RgiawicB0Xq45l4KAewYXcFP+gfUQ
X-Received: by 2002:a05:6a20:548c:b0:3db:4bf:53fc with SMTP id adf61e73a8af0-3db26cf32eamr7081017637.9.1789369237586;
        Mon, 14 Sep 2026 00:00:37 -0700 (PDT)
X-Received: by 2002:a05:6a20:548c:b0:3db:4bf:53fc with SMTP id adf61e73a8af0-3db26cf32eamr7080767637.9.1789369235498;
        Mon, 14 Sep 2026 00:00:35 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm25962177eec.24.2026.09.14.00.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:00:35 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:29:42 +0530
Subject: [PATCH 10/31] arm64: dts: qcom: sm6350: Add domain idle state
 names
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-idle-state-name-v1-10-660c31187819@oss.qualcomm.com>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789369181; l=1396;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=GLka7GcVE6RBS400scitvlbiRMjZgwnnJ4v6VFdq9FU=;
 b=ZJ6fWhuXdkgUN8OV0Qkwk1HhkVVSrZb0O25IiEPraYoLQL3CnTp+XY1R8ViaDMwPlYoUMkR6N
 f6/Fu1JBD5UCPF/KiDxioHBQ1G7ov7VBzq2oPLK81oWY28aeo0DXgTd
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfXwNnmHE417q1T
 HEbapm+w0UcJVxL1Qx26iwT5srx/qECl1Lo/lkyFpl56I2DgsG2kR/U+dgDQscJbPieJfYK9PwZ
 4moFlHkAYE8BSo1/9j9nd4/NXKGK3kd3id4UthsvOBEk7wuTEwDYY+EopuWsK2akS4V39g8rzoH
 9SYLlC7XDJjdEBqZTQDRtUeNyjLAmnFg65DGsdoNgkMyUt8gqpWHJaVEgJlXqsdLr0LGU0oAhIA
 8dr9PKi39ogjcb/U5drSxFCgcCHurQglzX2epXaYnEfsSYSqnrz/Nz8VuS8O5DzqxmyGgQfF4wr
 YA58bcKoeh3r6JZohEi6MZVp93U7ClwdsbCvW+287LBy8bMiJEfzucnTr2mgBa7k6cXyvVYr+ZW
 pqmYi0PwGTuhpqDBt0R7r9Antj+oZ0IMVkwgf8r990min87XH63cDDEHXdHfSHaTc5d5ThPzjmn
 MqBaxrgVEm0DoL4kMPQ==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa79b96 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=8fg_tvuPYJi1a8Ph9hQA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: YzJKfwitfAwMJuoKzU1qjNyreJeev9_V
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX+dpzf/Nq1XgM
 RvhDWAo1o/rFfoIiG+gzxvMvH/X5MYLFkL6ItUMJLhFhvBTCU/4sgGchMPNXk+NwgjuLl7FbgUL
 yXWaN8AHOez8eTZBGyJn5cASUD5rPjA=
X-Proofpoint-ORIG-GUID: YzJKfwitfAwMJuoKzU1qjNyreJeev9_V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1011 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140098

Add the idle-state-name property for the domain idle state so low power
modes are described consistently and its name is printed in pmdomain
debugfs.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 15d38b7e803c..379e0b48f94a 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -292,6 +292,7 @@ core7 {
 		domain-idle-states {
 			cluster_sleep_pc: cluster-sleep-0 {
 				compatible = "domain-idle-state";
+				idle-state-name = "l3-pc";
 				arm,psci-suspend-param = <0x41000044>;
 				entry-latency-us = <2752>;
 				exit-latency-us = <3048>;
@@ -300,6 +301,7 @@ cluster_sleep_pc: cluster-sleep-0 {
 
 			cluster_sleep_cx_ret: cluster-sleep-1 {
 				compatible = "domain-idle-state";
+				idle-state-name = "cx-ret";
 				arm,psci-suspend-param = <0x41001244>;
 				entry-latency-us = <3638>;
 				exit-latency-us = <4562>;
@@ -308,6 +310,7 @@ cluster_sleep_cx_ret: cluster-sleep-1 {
 
 			cluster_aoss_sleep: cluster-sleep-2 {
 				compatible = "domain-idle-state";
+				idle-state-name = "llcc-off";
 				arm,psci-suspend-param = <0x4100b244>;
 				entry-latency-us = <3263>;
 				exit-latency-us = <6562>;

-- 
2.43.0

