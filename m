Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794413767;
	b=sqFaP+zDkKzxtPRcGnW4hWIPVeGq6nBlDmxgdZswLyQC4WLzIixU/xcWRtDs79yyLb9O
	 Lv2GvfOLGpZFUTRR+2Cc+sMZL7zpn16md9y3VeQLfVptJ1iAbwzcFqowRWk4ua1fc+YoW
	 bnI+JBMGT6I+zABDoOm6XncHgx8eUeudRxPb9ww7wJ2wuJey0FWF/0lljm8yaPgLYumsW
	 6ADLO+PYn0EB+KVWMp/AaDon3pCaF6mQxQcLKxFEQBndHtRFNZQpbh8KoMBCmswFM3HwD
	 SxbKRit5Y1mH6mjpljpxlyBiEZyWWE81tj/+KepC7SmQxI1GKAe7/l0XipibI/0KLGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794413767;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yN8rEZouC3yfilpL49Nn9rYRbZQUqv2Fvy1imuPZoCo=;
	b=Q2pbWxGNImZL9lyhow07ZtmpF9MN5z3z8oFNZrLlhDmwGGoRspSjcy2nl7VdVZlCpaeN
	 1bLoA2ORnqIsbK0AJ0I9qpsWowwR2AiKXE2VIwStoUfc1nEQsKcnvgiPAwfUIvSZtEQWl
	 e5GxwwcEEqffaHKIsUAN2PTgO7da+Q7Qa5uaZES0hJvoN7uC6ZG/6UhxoVHKqfuR1qAfv
	 yibaO6GIM6Wo4uG/1RokBJUJU5opsxPgX3ja8o4nNiCB0Vq3j1Wj1DxKj/uOS9RqfodIx
	 kASFB09LrPOVUV7g4P7waZUy2HY2axHaojoB3nf7O0i6TEPdh3KWmlq9/cOuBJBuyzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JUphMJ03;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EqQhPN3a;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C89606A332
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 16:16:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42C89606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JUphMJ03;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EqQhPN3a
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF0PKv3290459
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 16:16:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yN8rEZouC3yfilpL49Nn9r
	YRbZQUqv2Fvy1imuPZoCo=; b=JUphMJ0330lneS4Ke67Ym/G1OlfGxwhhr9TBaM
	qzZJARTt2KTVr9oBC6yMM1gyGqszmGF9ukpOZ26JDmNUb3DCUIU4vIprmhTmtfL2
	hURWWTVrHopLFC/EOdvLfuyj9NkEtkm8rXvyzXs0ne2khAnLq7sTeGyCFJm8pn15
	T+tuYMHDR0CJg5iVif/L1zayearw518TC90g46csH87sQ0LoPn2frYTAbpki3aLJ
	hQi8GLqYijsiv0T1WkxjZ10tcO8Ol+jIovD5ABFi+tmGHtSlKN0Q/fJD9U9NJTqJ
	h16Bg5pEfxt0IUc18HwFB2Iz4H+Pa5XIDsjNMMEMgk2+cuNA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvt150kcu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 16:16:06 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1aa0fb7f157so5328893c88.0
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 08:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794413765; x=1795018565; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yN8rEZouC3yfilpL49Nn9rYRbZQUqv2Fvy1imuPZoCo=;
        b=EqQhPN3aRrmFp+lXeKnLm8ckKMS3CB/lYJdNvDMsw7ub5yeya18mwwiLkJeS5j+dYE
         WKa8te3MbVRYQ3DohmKjomRpzFWb4CV2IJX9+uMI8+PvWeKTG4uLlAHVeiIv1QJnx3ED
         KW4WYM+4XjVb0m+Jj0TepkTnnbMasoJAQ4RzgMiu86/qfmRzDZI9MvlwdF4G0P8Tsmqm
         lNgJDp/IRd2ynipCoq+Eemp3NrumgFP9Ah64dGikRnSuby9OJisFDElLCTbsinR1w0HW
         6JNBN2OXSTHuvaifF0fa4zr3VH4kGlSVfSIlPtB5XF18F848E422Ml1yAoN+10Fx0BkW
         DYZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794413765; x=1795018565;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yN8rEZouC3yfilpL49Nn9rYRbZQUqv2Fvy1imuPZoCo=;
        b=kOlm8Fg2RILLa669LkppXDiM1R+kWu7uvVWZsTSQe0u5BJTbWcD8kKGy/lvZSxz9gt
         0+yGIkyaz+/8ywfpaNh0A9dXBOKa+1dO7x/yAXlvDnNTbhcx4J9aKg4rgYd3mlJ7W5jv
         9USZwUqWUABSISKcO9Ono3ey6pmVHOYqEd0Hei0tXvvxBfefxecx7xLd9xRWb64k2A9H
         /PgjYSbC543MhGZ8j1gyG/NLN99KjT9sMe50Un4FUts6BHkl9uVF/CQzvG1MfFhCRvtq
         qI7aiFSoGfcIcqLm0wQlgJpPriWNWBc1lriZ/5MOBNLEBmxKOMOjmwhSYfkSn5lDbeNn
         pfVQ==
X-Forwarded-Encrypted: i=1; AL+hErHcJ4alU8YgV9E7WV3bqtsDbyZFQlykcqc68ETaaUZbJ2eINBo6+ICkF1zYhnDxAEE1PRG+mx6raoVT@vger.kernel.org
X-Gm-Message-State: APuU4Z8ijXTQ/zNuNGX58N/sxoVSfx1f+kPTRlloCZlsOegHZr/5xnwb
	nYzkIHDg/Rn7JkucyM55CyvWT5zvYbLwZjStgpQkW8/ntw8/XKpUt6BZtClPIGQR5mjtrCizWrS
	hZyJZ9331JjJqwh9q9mwcjEtGpqlsxujKELw6fBmqpgqzuFKebjtAEjO+mw7Ia9qx
X-Gm-Gg: AYBFou0NgIBGNKgEHCZRInAH8Z+k9eI5cbx3zrqe/8m+L6Vdh8/Fzy6NTt8m7Z902wh
	GGMgSvwRS7V9QwCYiCq8NJDX9pDug2Q+RhVgLpSiMj/8memB+7tIpI4PNW53mtheYywgiSgmzBx
	KYYV5hLInUerqwpbX/vCOOcYPCgM11ZcOJrASA90BK7OV9Fc2HrsqNBf3kO12YJ98yglrld79pJ
	5GJ8Jcaz7S+Elx9Nh1OEHPj6IgotgkJMfceIyxhZ34yjhqCfzng7bt9PjosmBHOTrj0zyw2AQIX
	JKylevL3+67gUZxR0nxhf2Uxj0bj6jKav6bn0SZ3Ty33SGjtMFa6BTnIwPunTDobzqaADJs4z5/
	7Y+3Xvb8jSOXPB13gljos4wyWgu0nV3KC9ayskLu9VkDFj1wsxj11JBPLW4MClJ+2HSPpVPektN
	+Zknj2okVFf1bmPSlSh/tbM8AHhNxS4WFW5uMjtN7qEjDKs24bdKUFi95oduEKI5hwczV3WezV
X-Received: by 2002:a05:701a:8148:20b0:18a:8164:ce4 with SMTP id a92af1059eb24-1b3c015056bmr2846262c88.0.1794413764888;
        Wed, 11 Nov 2026 08:16:04 -0800 (PST)
X-Received: by 2002:a05:701a:8148:20b0:18a:8164:ce4 with SMTP id a92af1059eb24-1b3c015056bmr2846245c88.0.1794413764380;
        Wed, 11 Nov 2026 08:16:04 -0800 (PST)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11150sm23548337c88.5.2026.11.11.08.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:16:03 -0800 (PST)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 21:45:49 +0530
Subject: [PATCH] ARM: dts: qcom: kuno: Add unit address to memory node
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
Message-Id: <20261111-kuno-dts-memory-unit-addr-v1-1-89e965f2c3ac@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALSU9GoC/yXMQQ6CMBCF4auQWTuJIGDqVYwLSqc4Gloz0xoJ4
 e5Webtv8f4VlIRJ4VKtIPRm5RgK6kMF430IEyG7YmiOTV+X4TOHiC4pzjRHWTAHTjg4J3j2xlv
 TtdaaE5T/S8jz59++3nZrtg8a0y8I2/YFspt2830AAAA=
X-Change-ID: 20261111-kuno-dts-memory-unit-addr-7f9fb954bb93
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel test robot <lkp@intel.com>,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794413759; l=1586;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=CSzQmEb5F718VpjW29JEnKagjfsiWXZUlmYmt8BWzBY=;
 b=FnK1YiaXFJxbht2Fknevak7wOF2gTBehm4QTIXKU84L4+P5N9blTlHv8WVyrtwPzDQAVQiEtG
 7QFwiGlWOQICfAmzPDYQYWjCrqBH3kui/I/QBiXEw7AFb5JP3sbmKxD
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2NCBTYWx0ZWRfX1fNhPUsc/Vqr
 wmuhhHCqckVPJsKYXpGUq7cyZ9TU8sLNLnuIKTAPLLWM3FBdQp6GhZOU4TSY2GC9dUL4kCkrP9T
 6YjMO/TjmPAew1bLSIY/KcHiRJ/FspE=
X-Authority-Analysis: v=2.4 cv=Yrya1IYX c=1 sm=1 tr=0 ts=6af494c6 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=d7ooX_hxsFC440dZs5wA:9
 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: t5B44R9YVGgDTvDT-DUQczALu03EiHKE
X-Proofpoint-ORIG-GUID: t5B44R9YVGgDTvDT-DUQczALu03EiHKE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2NCBTYWx0ZWRfXz9Z7SAxCFnSm
 T0UybKnd2rJ1H0XW6MCN3y/L9qVGJX4OUUq4ohFa+0d015snIOP5pIqUfDUAsWyF850QePIjzCB
 xGD5PP5GEvfryG+90dR72/kFcyUpEE1TkeLPvlRY69SBKCIxo/CMbquCDh9VC3sCC8m1tqiyKcc
 OkpzJIcCQVblzISnhoxaeyCDTu7cfCKg49snxd0dejvweGzP8Z4pjWvataE0G3DwxIf4tqF+rjf
 IzKeB2xNTnKqUIhi/zFSYPiwyLm79JonZzPwbywzAHfuDjTbF4m8LGap/NtMnF9aLmjendTuZ+W
 2bNHXhRzeleTNCP6cilAQJTKgJGW4Avx7SDF9UhdOQ2jFwS1kGgjWERcbxKDAcDAQm0N4qAFZdP
 TMgY65VN/heS46LDHyys4QqeFw5XVNvSRccIKH0rs1rW4reS4ZShi7X3R5FzFm7E2hBHujf2kqb
 3b9vUtVusu40ch1Ut5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110064

The /memory node has no unit address. The dtschema root node schema
does not allow a bare "memory" node, and dtc warns about the missing
unit name with W=1:

  qcom-kuno.dtsi:89.9-93.4: Warning (unit_address_vs_reg): /memory:
    node has a reg or ranges property, but no unit name
  qcom-kuno-idp.dtb: / (qcom,kuno-idp): False schema does not allow
    {'device_type': ['memory'], 'reg': [[0, 0]]}

The bootloader fills in both the base and the size of the memory node,
so keep the reg = <0x0 0x0> placeholder and name the node memory@0 to
match it, as done on other 32-bit Qualcomm SoCs such as apq8064,
msm8226 and msm8974.

Fixes: 7f6a63bc5fc9 ("ARM: dts: qcom: Add initial device tree for Kuno SoC")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/r/202611101833.G7LTXoJv-lkp@intel.com/
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 arch/arm/boot/dts/qcom/qcom-kuno.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-kuno.dtsi b/arch/arm/boot/dts/qcom/qcom-kuno.dtsi
index 9b111525e12b..eb5c1f3630b9 100644
--- a/arch/arm/boot/dts/qcom/qcom-kuno.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-kuno.dtsi
@@ -86,7 +86,7 @@ scm {
 		};
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		/* Bootloader will fill base and size */
 		reg = <0x0 0x0>;

---
base-commit: ae2005cea2e4f84692268e54199bb03f5c6f4558
change-id: 20261111-kuno-dts-memory-unit-addr-7f9fb954bb93

Best regards,
--  
Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>

