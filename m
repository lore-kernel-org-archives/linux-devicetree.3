Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796ED31B83B
	for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 04:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789793210; cv=none; b=PSrqkDUKEXb0gbdcXroKDebYFCCD4rd5DugMNjVh5zYFwqRmjiomik5NhrJqO0b7/LJVyP/MZG6LNlOsOuRWGjPOpOr3Ay8O1gwuiqrMbJcF58ccGdOkENXWZycCX6QZ+4dB7JlNK7MuxKLsWJ/SSC/+8SX1iEld6KpOdXHSpHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789793210; c=relaxed/simple;
	bh=QNrXSGT0/RU9FGBzR1eB633FR4BNgbJh7WtYPXkRtdE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fYyz4w0oC1ki+dOUUXaqQhgg/Wmzyw+0dKAcN1Ax/JnxQXhFF91Hm2lsrumagqj1jHAndNs6wvcCxu57T/ZWX5syjA8o4J2pxW+nWdzq/wecHq0rEVke2VSdfZBY55bstaJjdAIKT5AqsGIp/gnBVSTMolaThM19E1oo/8tDfys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RE5scQir; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GMLKGWGh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RE5scQir";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GMLKGWGh"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68J3jfBv1966797
	for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 04:46:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SI1Ns+uHaPcbeTHET1TQedvXE0lo2Qef6iv1Q3O/hNM=; b=RE5scQirmniXXNJc
	rj1SuLkxf3KcMnXjISSr1GGOzU/Tbf8zwvVRPcS6/ONl2MLTdTy1IukxUo51hrgU
	xj/bmTB54OAYohCVvwhppQa5wXwXlALtFONIk0vz0Sm4dejzTzmCivHksaAa6L/Q
	NyhPxAyGayGVfGSZEdzSmfq8LdNUUlpCz2Dp0+Pcc0gVW1I2I+4OABIE2Xv3dluV
	dL7hPxqmyyjP3o7mvw8G3/1AQbrG8V/IoItqyjCve1xAWuywSUvmm1inCGvXqO5+
	Ql/KmZ5ZtSyOBXC70fmZwy5uJAxMsXC/QriRzmQF+cABW1snOdmSaaVTpMI/gRov
	rFkw5A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsjs803pw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 04:46:47 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39af92138f9so2032174a91.0
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 21:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789793206; x=1790398006; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SI1Ns+uHaPcbeTHET1TQedvXE0lo2Qef6iv1Q3O/hNM=;
        b=GMLKGWGheLEAVKSV3YQUqxNXwJ01LqeVNBtS2wgX+iYa8pY1Wy86hbfikFAzgGRDnJ
         LHQgvvCkdZGZ9zEeZSmLIXaZYLpW3ZvYYyY+8I7WbxIjpXalq8bNn/CR3CaEiLj6+4N4
         C28PvXGvg3JDqYBfonjASPVXQgnjs3iSsgQui0l9ot/pMHc8qE6xIfUgV5d6K0uJKSSB
         OjMySJdF7JSQxCKvfSaoM2qKhhCzG2h+QcCTQfryr04RDDClXQUzgCo2PMyv8zGEjVX9
         jYT+7jg0FkJu/ivHK7ZIxa7ROeq0PBBi2u0Sidek3uu6FzyWwpfdbzMgjh2SUp7ShI69
         f21A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789793206; x=1790398006;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SI1Ns+uHaPcbeTHET1TQedvXE0lo2Qef6iv1Q3O/hNM=;
        b=z92oaNAOBBQombaO/7cP/UJJ1q3qWJ6aHStKW2BVkV3GVsSREmLFEnVEyntWv64xKA
         60fmQaj5XKU46gHh4aUu+sXH9V7B4ARHUlEbjyp8AvyiUBRnu3kra8NwVfwZluL8Yq2m
         +FFp2c6D92Zhl5nHMDLnowpjrTdetFqxETwFJIIaH/p8TBrq5OjbHSotnF/a+fT6836T
         YW1x0mjQmy43a58QOxMWNyOT0mKz57W8StY4mOnUNzMMqDLCKwTP88/pwqrISXnq3f1u
         An3Ph+f73cV3pX08onncdZyD9IocLILKb4WfEXCbuAsL5lMtj8wn2gdf7osPo/cZGOKh
         ah/g==
X-Forwarded-Encrypted: i=1; AKwUvBzoKG521csee7OPd4N9tv2J1MQcLRQHZuJ53REfH4vfvboXRCJNKrsna1YBZ5+igj0sP7Dm1tWywXw9@vger.kernel.org
X-Gm-Message-State: AFuF++ntUtPkjee3y1lbXDWgtPmvuLhx3b1HflypsavLogvcbBd0YZVk
	97IgAlK4/JOCFirNvRq+wLBAbeoSNSn6vGFSbhkpeTfIN7vk4V1ppJps8IKOHaahwDaGzQjKxxT
	3AQt6IfdiLi2c9MEBkN14RFllPZUVWxTRfH93mRBdzJFv5cUdpMbWNGVzFPn5tRYoOECjW6GA
X-Gm-Gg: AYBFou1h30+I3Tp6dz/Gd+9fylClO7OSWRgis31mhRAfRn9Yn3JIEVYE2x1vhiorvEz
	hMaP27M3g7IOQtpZg6kiogVf+QpTZKV8+Uy+7HTHenEMwnwUOVtv4oK/wF+0D1ytVEY/bz8T1Xz
	QFw2bUV7f7NRDg+KK7x/eaa59MpYR4G2wFicHAxx/p1JiqMiOrFHAD5WjoITVdkl73PzfL3Heoa
	5QrMRWsYKTWGrQPyhCkf6kua6CjPQ1MwPunkW+MXRo8PbHvDLGF+cuZESkI/6R/eVjGPFZ5nVdM
	mgh9JJRf109J/tl0O5B5cib30xioWvH75Ty5I+btt2MH3uM2yw8oWuN31CCHzK+unHPoqGCrZEg
	Vu1tQFBkMNIIqXyWUlOiz60N+CZfe2NmY
X-Received: by 2002:a17:90b:2f04:b0:39e:237c:50de with SMTP id 98e67ed59e1d1-39e35da1f06mr12756129a91.3.1789793206428;
        Fri, 18 Sep 2026 21:46:46 -0700 (PDT)
X-Received: by 2002:a17:90b:2f04:b0:39e:237c:50de with SMTP id 98e67ed59e1d1-39e35da1f06mr12756112a91.3.1789793206000;
        Fri, 18 Sep 2026 21:46:46 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55bfec0sm3839771c88.7.2026.09.18.21.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 21:46:45 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sat, 19 Sep 2026 10:14:57 +0530
Subject: [PATCH 3/4] arm64: dts: qcom: nord-ride-embedded: Enable iris
 video codec node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260919-nord-iris-v1-3-94428761ec06@oss.qualcomm.com>
References: <20260919-nord-iris-v1-0-94428761ec06@oss.qualcomm.com>
In-Reply-To: <20260919-nord-iris-v1-0-94428761ec06@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789793184; l=788;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=QNrXSGT0/RU9FGBzR1eB633FR4BNgbJh7WtYPXkRtdE=;
 b=Rnpkeh/um/yPQIp001CvYoCvjgiBi+CHqntQ7vgesxgSiR2a1W7NY3Ki3vcjm2ZZeZzO48SEm
 D2Y7IqZ1KicCUwo8tqwBK0+jXlUVX3Pu9dwm1Kfe5NYg8T1E8fIN+Dp
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: fHfH7nEp-ZaXvpVQIML8eazhjmm1TWeb
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE5MDA2NSBTYWx0ZWRfXz9f0FeeWB0He
 UelAue1/r9PiaMly8atpMiPrG8KNLgBd2p90cU2AXCiQkL6D0EuaWVyMwyejZBael7lmNFdSb/f
 fIXiyjee2RvZZJahlQICGsqnhuIAEms=
X-Authority-Analysis: v=2.4 cv=YqWa1IYX c=1 sm=1 tr=0 ts=6aae13b7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=HtMBSpEu5xi8YlTHYloA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE5MDA2NSBTYWx0ZWRfX6Wqd30V/nLRb
 ujt9RkOBEQqfvZN/Wz4xgCtHXf9xac+5gIAHHMyHA/k0VC1h+tzzaQKijziNgQBpitpRe2IAAU9
 YDMXZj0H+D8EsSKodQibImino5mUkVyiptJC5PoxMYdOcNCfUfIJno9912dxWBlk+iYZljNc+Ji
 B7Eq6GZzeEvflLMhsAV3aTytqFx2yaWDzwJaDuTnP5fY3y2PqW6VyNuQGntPW5verrWGYiTcjk/
 Bg5UrVRUc8Ja0230CHKpZxMFLcogCYfwwLEhsC6gqWewJNoykWxmx21JSnCFawHWqOh2dxtxG2b
 6xM7ZSpfr+xRl9ZsnmLyL7ZVnMFavwwKUM5v1Oa9gak2OtCMmweIvH2KgAbWiJeGP96ktd2pRvz
 14Dx045nBIGXt2F6zM1TcvupuiM6MpiK/gqqy4B9fZigwWowghnYeCkXaKFHhQ+OF7CD7+Yovce
 Cj5Djwxt1jKHQq2jDUw==
X-Proofpoint-GUID: fHfH7nEp-ZaXvpVQIML8eazhjmm1TWeb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-19_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609190065

The iris hardware block is described in the nord SoC DTSI, and enabling
it here allows the media iris driver to probe and use the video codec
functionality.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-ride-embedded.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
index 2ad26902ffe6..98dcf57652fe 100644
--- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
+++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
@@ -442,6 +442,12 @@ &dp3_phy {
 	status = "okay";
 };
 
+&iris {
+	firmware-name = "qcom/vpu/vpu36_p4_s7.mbn";
+
+	status = "okay";
+};
+
 &mdss {
 	status = "okay";
 };

-- 
2.34.1

