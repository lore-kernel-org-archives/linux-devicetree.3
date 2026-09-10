Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB0649BD7A
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047008; cv=none; b=aSb7RRw180X6F5iDVcGp8lffPd4eG16lqD+mNYs/ATKAtgHm/RSlx1R3WjXls9Rq58JcYJz31YqMF8jntw6Y+MW7hBLzhTIGeAG9qKNsSgHHk9X6SvGxRq6+7RUwChptYUK95/3b8PgO1GdBJdQXMrKAvXqFXyBhlFdMTNROFGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047008; c=relaxed/simple;
	bh=3UO+7i3bVMM+F/tEv/xBz6Ef+c3e3C4o9iDognI3z/I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ESRkZsgrwtO2ArYjitTfr7VymW9rsiH49sXTnnbxTl71iS6BuLCOFdEr2ROz1GOY+9KR2xy/HckrQXT/O9dvC7O/rg7NrZkMyJ/QxW0e6SkXAtT3GLSyXNW8eYd+EKpWu4QUwTx2Z8YoCwOcn0pxt69V7rruEn7MFhChvHsruPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nULGqOmW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WKiD+91F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nULGqOmW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WKiD+91F"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC86gs782205
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:30:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LkzXtqKbuyBYJrFeljSDmLrx0TUg3gMqk1oP45bnArE=; b=nULGqOmWgKj8eo0I
	ZsShDXBraOlH7mhbsD8PNkV9OMxgBV0ERrJg5GSQPrMkc7vHAX6YPTstCyNo2dMd
	anal4fRbaaGNuG2pZh/bez91ZMZtJb1gDIzZvpHvKWk6q3sUWcDihrDHAb6yBshl
	hsZ0k4cusFaRVBfC111Ff9d1BCpXhg3Z+fBCAFWVi+rTdVLPZamYEcUZXfDZroCi
	JAmW02eOd2VyvEyFw4IPq5+ntF0bJIc3dfoJPEjQIkRbRt400b11q8NHVxEHO5M1
	32oGcoPXRUG4/HkTJKFl47DSpre6vG+lFuwVXjH7qAhrrdvHsdK1DIifL4fPmch9
	/xVdwA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkrak9aup-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:30:05 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4922b7c31so3516475a12.1
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 06:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789047004; x=1789651804; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LkzXtqKbuyBYJrFeljSDmLrx0TUg3gMqk1oP45bnArE=;
        b=WKiD+91FNsNP8+XJ+VOXggDcjbzULln3ysyofNdkfbzn7joEUR4UmkoUl1tAqN4fdg
         aIJpDYP3Fye5ZPsPbKoyaHnuFEIpDuex8UuINEQQ2+CnIrPpC2KHso7JK8j9l69fNsQT
         CREvmJTzh5RB8iXC3zO7eJfoTAAHiJWheA+5mi1vQiTLSKU8BWBaHb+tfLR5/hjHBf9J
         0VL7fGv3UH8kHnLRnXzgCyGcpfHTh0xuhbDPfwtdk3Vk1rNmzSSHJA7H9sy8Kn9PKFBo
         HEgxD7FYuKtPoT6vBOhbMmoryKEH/XFMe4vVojoTjnGBle3Ly9aMKDL+7Cg61TXhczWf
         ElnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047004; x=1789651804;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LkzXtqKbuyBYJrFeljSDmLrx0TUg3gMqk1oP45bnArE=;
        b=FPafsI59HMH3og8bWrLlphPdaJceO0L+TO2Iag73Mzsx4iGKiD2KGlzcCgjd6FuHca
         5xqAFOyxjg6wFmfoWCq/ug+j7lOGpkUjsa/dieNsrtDgrxOvsqHhTeToK1YMulSrr4pl
         SOfH6OTFL/HNfJsaNLSMOo8WesvtAbz3tz+g6uUdrQR5Ve8ttdIZSzYkUz7wJh6bXUEp
         8X5dN9hItGJYgVARUte7s+t2YKeG7pJ+zZBqywzJuS3Sm/44CLowi9HfMpn7ZgsVg//G
         rtDJ9uppC88p9Weji5IRRK9oT8v7HyiJVaVUxJh0ClGOYLiFq5/dx3bnKl+RZ+DCe+A9
         MhlQ==
X-Forwarded-Encrypted: i=1; AKwUvBxA33BJ2Ltj32C4lj1pF04MB9iU/F3d87F1H2eGWjK/GVD3yul1rBla6zMVlFAIm/eox8bxpVc+ULp9@vger.kernel.org
X-Gm-Message-State: AFuF++n5TPApg8ysiUEeAuoQznd/pKPvayLYrgm6570i7daUdKmEieME
	MT/gM8tyzOVJ5cAzj5q/ViqweAQqNjltX8rNAagHqQIN8GCfD3IcolAyUGeWAJl/mG2XTZAqIcz
	2C8CQ9Y3A2ZxEOJW/Bj4Oydw06mLTF4ALlVxvY5Xkvhp7/aB7KLVWInX1vCDKQ0FC
X-Gm-Gg: AYBFou3UZMM+OXjUvTRMV46Kbg0ViTZTdtl0Lq1xtWmgWiz6zvy5lCd4lxPatW96hUu
	ZJj8gx9MoOdy9OSHD3fMnxOA4KY0zL9Vdnrtv3NNu2hz3Sn813SWHXr4ftnVuaKLM8L0cJJlIUW
	nP10zfRTf3oUFbZtSGZHtXki3bXrHUStRn1WiAKxFOfylJTTH+omOSfZ02nHXKIigLQVXSqz7sb
	Kgwo/CX6ObQaPuYPF7zXf+oC69ycWoJ2cofjOQ7DXPGvyHUzqGrvz1ptrqZHS4aLBqBIVkxkcb0
	Deh+nfc7Qq+33Jl1orGCIg1Pnm01y+vuvymqU509GG+tcClBiebt6XZ5EnIJwmNRMRQS/FJdQcm
	MWb8gizKC47U1MxMW7zJoXwoa09Mw6C9fukw=
X-Received: by 2002:a05:6a20:72a3:b0:3d3:adbf:7781 with SMTP id adf61e73a8af0-3dacbf14d3cmr11893559637.22.1789047004435;
        Thu, 10 Sep 2026 06:30:04 -0700 (PDT)
X-Received: by 2002:a05:6a20:72a3:b0:3d3:adbf:7781 with SMTP id adf61e73a8af0-3dacbf14d3cmr11893497637.22.1789047004056;
        Thu, 10 Sep 2026 06:30:04 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:30:03 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:59:02 +0530
Subject: [PATCH 13/34] arm64: dts: qcom: kaanapali: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-root_port-v1-13-90a252ddbbfa@oss.qualcomm.com>
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=933;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=3UO+7i3bVMM+F/tEv/xBz6Ef+c3e3C4o9iDognI3z/I=;
 b=JdNq78YtfORTadJu5cVFQ/Me8bbut/dMQO2XVya+nkIAHsBjdzpuvgl3xrvqngnMVfe4g3EYD
 u2Pr36OqFOGBLmE0ZCiwpfLlOmcX/N2wRgMS2xvgzzwXwrZIkjFHUQ5
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX3ywOQ0PRSJkF
 IkoJ6Gko4zx49T0xg3Sva8SK1mkU8OhVt1OF5b+fVvLSgrN/J8Iux6z+3t88ARufHczD82cajPg
 v2Ns3r8ueY2eaeiP3shrqBo0bpNYyDg=
X-Proofpoint-GUID: ZEVDuT_YmxhLFFejwSWRtjPKfahjZDwX
X-Proofpoint-ORIG-GUID: ZEVDuT_YmxhLFFejwSWRtjPKfahjZDwX
X-Authority-Analysis: v=2.4 cv=EspHPicA c=1 sm=1 tr=0 ts=6aa2b0dd cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=bu6UjZ7a5GH_BZZocUYA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX8Z4dxFMDb6OV
 4ilmaCOOKMojO5ltk7BQ/AxFjcLRKzber9X8MRmksmKfT4Qx7DkggnsCdwsltRPE8WMc65w2wSw
 9aP4RNo64JOCB4ZOF0TtZhdtNY6IvRghDQiZ7oFWR01EgDK4avFuqfPm6YAOLVcLFqUHtFdYYg/
 YLY3GgW3Cn8m3VpATj5jDmCAnnBgvFLtBzFXOWFYP2RYPGNDudjzqLjnZo9ia184qF0Uk5xcTNW
 OKEEmOaW8np6Xh9Z/btOBoHSuaJBCMqXP9B2SqXy/eHgKZ9NVaa3yaRzj0GJiAHhkCnBtFphvKh
 5SKhTEdvm4m32DOg6UxsioSgccDQ5WDlsuLDiaoLVZ5Pe15QHC49NBuaAEtyNTsjM2qIBg8HcDi
 UU4Rg1aIn/2GieOa1EdboHzmhl9Rqw5zhkmWxQQ/wLiAhB/A6BiNCzvHdAJV+6B301y/xHGDgm9
 OT606sr2D8504+uhxfw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100161

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index 6d817381bb37..83c4f93a654a 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -976,7 +976,7 @@ &pcie0_phy {
 };
 
 &pcie_port0 {
-	wake-gpios = <&tlmm 104 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 104 GPIO_ACTIVE_LOW>;
 	reset-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
 
 	wifi@0 {

-- 
2.34.1

