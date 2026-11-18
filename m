Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794987938;
	b=qWV69BsBc/lXK/vigJ/+s/Xe36H5aWmCbyYOZfxJvpWAsLJeJqLDqZpG9wtZPxJ1iVvm
	 hZaSP8RmGYBhz6Ew/6Ox94NRf/W+d2savOgsIax4/xrrgQQM/gyZk0nZ8RCWOrANxyiST
	 IPcq0N/T2M5dmHDPBUPs3N2GZbQlVu1FPwrAYj5c8b6tpIcQWsFMLxKiZ4BjUXCz84ZwZ
	 lqkzR7QSFm2CUzEpeuM2Z/x54cbHWpi17D0iSwJt4L3vUWiOs1E5r8xNFOXfweGBhO1aq
	 jDqUrL01FOEp0vVkBNaSI9aiHSx8YCp7sDUZC9siJUGClATHKIV/lbstQnWPyq+3Gjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794987938;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=EXJTyC9DJ41IUOx6k9+mNGczBOiPcutOoz7ayN1rX7g=;
	b=tecAGynRQP4sACcyhtQNBXKZ2DzgkPF09qnS7mGkRy6AtAB3UFfy4dnd+CaMSxsKtTAH
	 7x3mKNsg84p7OoYP4Ru9BeSCHugt6Rkx+K6IDcQFQH5Uogwhobp5DNXhV3OIY00DwvCVz
	 y8iGykIsVemercGOcwXobdnnzHjiILMWaUillh/3Hh7dl7u6TbMcwyHBoZgrqdvsnGxX+
	 5v34GnWnaXMQFbygl0Eak8j+1Ee8IuKC2kH++TeD0V7grPo5xKTIuyn021qGZ3O/VNfoh
	 uvRf+Ls4ViBNasiXUNhetoL4NB82mGpq1i41ksSDgw4HV3tUU6H5D4IDlzx0yOYuaTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m7u9OEVa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cjXSGmql;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D961B606A32C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 07:45:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D961B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m7u9OEVa;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cjXSGmql
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI7FhNB2615362
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 07:45:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EXJTyC9DJ41IUOx6k9+mNGczBOiPcutOoz7ayN1rX7g=; b=m7u9OEVaEHvpKVMI
	XPcEemS9a45Y1pYdG4OVtwfgYrCUQeZ3BRM4hSUwzvVHhqbQ8YP5WnWOmLa8U7AL
	nQ51C0CTkyNskPlQ4LZO6vSrAqYgFTPu/1RLfyDWjhqg2JIJVzr2ZxQMLS50RydQ
	K+Lnr50mTUCXWC92Y0yx2/sXvOWffNyGxfM59m29wLhpVV8aM1PM5oVkvIOJsO/R
	k3DsRFqttDUo5POxpIcszaKg8ld6jKr3blqSeKD+gW6X1Bf3rrZqEvKMRMW8pjO6
	98M7hvfGOalWf3cSZxlAuch4OB+n2L3GdMKPIuK24VzoJ2k29vyc5h99XfhuBgaz
	KG+1nw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8hvdf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 07:45:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-94607500fb0so110936485a.2
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 23:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794987936; x=1795592736; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EXJTyC9DJ41IUOx6k9+mNGczBOiPcutOoz7ayN1rX7g=;
        b=cjXSGmql/qcW79pYdyxrLTRkjhADG5D71DAJe8L3sob7epFxt2tzx+BaJKjb0tGBUK
         XKz0PnzbAH3hjP5+a1ceMela6PCh5vYXqa2QUzwse1bRUi13i9mK0UaO84FqiyRw3atU
         OONij1nr8YKfi47Lk+Kb83Uwzp9a7u8cwvu6WwC+6yAbo347YzydCdeY9g6lWr58nfx9
         dm8LW6JrnJxlNeYI1BUpJY3JOT5xX4BZS6FBY7NDZ+9YgNilH/KVvilgR/jZTwLddH5l
         BHNRDJclHjZJAIgSLKoAu/RTFHff7/RkM7a0S//HtmA1c0dQeZlPDXVESTPu3MNqmxeU
         BoMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794987936; x=1795592736;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EXJTyC9DJ41IUOx6k9+mNGczBOiPcutOoz7ayN1rX7g=;
        b=1C8gWEV2wQVwcfhtafJHslorA1dHQBDBURoNh0Hotnlnckiv6uCfOA85pydS+oku5L
         yEIyGnAwW6/zRjIC41j1pYgpF8LZaFbCWCz3UN8Rz6iyODc6pOcG0GuO7mCTSheyEpL2
         M+V72L2q7pBVA6SypMu7+K2bm6UdbPBeiaLG1A31CAMO6LADeWK5Fk4r9hEhvfTvMeLJ
         v5MqRiRETF/o3wOuyf/2j8ON2aUfPWvvlkSnW9Bf6eav9GFJij9bNg/9cNyAW2v/ouk6
         zF7IVmqGOsmYuh7/HpvH9Co5LT48MSkcfd0M9JAxZL/sR51qprROAwqJiDUqSozcTYDF
         fHNg==
X-Forwarded-Encrypted: i=1; AL+hErFUD283lUw28epLtoEaB4zNr8DqQHBbcybGgJSmzDjvNAg4opjY0bVOyylgOSTA8kT9FhCPlEyCie5n@vger.kernel.org
X-Gm-Message-State: APuU4Z9FRhb2CC0wV8OeDKz8aev/JS3zUyqWsq7HNDEGoHZMmR+C8HP/
	BglG/TQVlVgf62rp+NQq3kG/lj3RcEa//Hz423k8u/0ywVczWpm7/iZHttGppDJIJt+uBIux+7L
	AykL4CzbS9QK+hceGd+8XPMJz74SennincUYpmglTXoHa4jt6MJ3wEP8ulLcPadd1hoPnDwqxCT
	A=
X-Gm-Gg: AYBFou00SsawJaPREpl7/xwSQGeawpiOBAT+e9AL/W4eoON1vp9fcyqTiXGDtKzGcJV
	sFKJYxSXgd8gdVEKs7UKu8i97VN15eUxvc+bqAjlQ6AAh/yiCbhARX3kXkp4noXPeBCIW9g61ZL
	exFaEIgP9wfIrwuuIFmHSRNHhxOALNFxLUk3orSZ7xEJ0CStbZpCPGPSufTOIcr+vfv+AlF1Bjd
	+Ma56fRzzlWT0G6YFJgUGwaUyzi9QWsInTBqkDiSCJt2Zn8EvlL3rvhzQ0StsF9i5s2omlvjSId
	fiJSug59Z5yOcA/670EG2qlFycp6Gz43bTwwcbv6ymm+ZHaN0Hzl5e0xuqBBjJ6xT2LqJPC2mkE
	2yhyp+f+Phuibr5cdkUPW35UDLZrWnb4WLYsnOtjaahusXjPeWedfQb0EPMOI9fDbgPYl5/Vi2S
	9ApOXlJ6A7/grqGYJtc4B2zGaYWnPYt2/NXvNbJTYG
X-Received: by 2002:a05:620a:6f0a:b0:949:52b7:468a with SMTP id af79cd13be357-949995d97e1mr344431285a.51.1794987936036;
        Tue, 17 Nov 2026 23:45:36 -0800 (PST)
X-Received: by 2002:a05:620a:6f0a:b0:949:52b7:468a with SMTP id af79cd13be357-949995d97e1mr344427085a.51.1794987935506;
        Tue, 17 Nov 2026 23:45:35 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b7b8444sm119359085a.31.2026.11.17.23.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:45:35 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 15:45:08 +0800
Subject: [PATCH 4/4] arm64: dts: qcom: eliza: Add interconnects to camcc
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-camcc-fix-v1-4-279d269e343b@oss.qualcomm.com>
References: <20261118-camcc-fix-v1-0-279d269e343b@oss.qualcomm.com>
In-Reply-To: <20261118-camcc-fix-v1-0-279d269e343b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794987910; l=930;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=hw0zxzf/1xzDeDl5Y3u8agRf1bz2PCqEVVqN89mjp8I=;
 b=Vq9K6QS+4F4RQocn46+6qHVdmQoeEuNmJZ1dCLRorBtYBo5+xHLGXySyGOHmZS37U4Po4gr3F
 uOqhtSC73piBQ+RpYFcPAinAWj49gyetLHHRk60l1nshhjGaUF2tgJ/
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: lx67ZfSjC-33hvRShYqFAaV60kdo12TF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMCBTYWx0ZWRfXy0yse7g6+kKJ
 aQRu2aTDAWiWnhvj+S8m3xPDXTpTZnxbcMiw2h61A7xqOkVJTNpv3C7jn5Utn/XtqDJ7gB5Bnxw
 O9w2LwvJpc54TKqPcrC4N6FRwmZStB0=
X-Authority-Analysis: v=2.4 cv=c60+0h9l c=1 sm=1 tr=0 ts=6afd57a0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=uBU3Tko-eBge3TvO44AA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMCBTYWx0ZWRfX4W2XF3ry/8KG
 COrFbR3xAgLf5Ay8xGqbwCmYJwtcrNoQYCEKsWRAA9jDbnfYv9xvKlwD/yUGAFYMgnVPNFxhS64
 fU4T52pbWu4EsEMlzf3QzlM4XMjKs3UCl9XYXYMhrzpiHxsCW3x3tzfoKYthETsRSQCXTK6HDz/
 EuLq3fmRn+gFRe1bVzRcpzabMRqMkZm1n3NdyR79+0QGPV+jeh0OFuC+IcNC2Mtm0MnWERPhR2H
 H/XAAa/QLdmkXW7CosjZc54Q+1GdwLJp9UAhTsAaOdaPGOdhk7EdOX+oapA0QHDXkMsj/yu/5A5
 6OEniXD5SbRK09G0bYyhnkrz/rzTXnbb0Ct/3QLIQo06TtoDn3hBDjMYkZbAAx7fABApolROkgF
 Dmk5VZaJM68wbU8lbDqRmf42iS6dzUkreIsiCrKic64NuNgs0i0yUX5GFrbJhPuutMMJ1wWR33z
 COsg/2S5ezqVLdrfB+w==
X-Proofpoint-ORIG-GUID: lx67ZfSjC-33hvRShYqFAaV60kdo12TF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180030

Add the interconnect path for the camera clock controller, which is
needed to keep MMNOC voted for while the TITAN_TOP GDSC is on.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 4a125ef386c025fe6ecdbf4d17a785d1532ba09e..9d0eacadee3fe72283219b630db751f27f61897c 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -3456,6 +3456,9 @@ camcc: clock-controller@ade0000 {
 				 <&sleep_clk>,
 				 <&gcc GCC_CAMERA_AHB_CLK>;
 
+			interconnects = <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+					 &mmss_noc SLAVE_MNOC_HF_MEM_NOC QCOM_ICC_TAG_ALWAYS>;
+
 			power-domains = <&rpmhpd RPMHPD_CX>,
 					<&rpmhpd RPMHPD_MX>;
 			required-opps = <&rpmhpd_opp_low_svs>,

-- 
2.34.1

