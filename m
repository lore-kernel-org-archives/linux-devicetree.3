Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C33E43D4E1
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 12:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778070642; cv=none; b=JaimHp/uQRyyXcAqVurJoNLjC3b7Nn9+r84Q0VYJXpt5Ocfj0eRkkmSQYJmNtEgdDDhf3itdtu3WqNfeVqePy2nbZltY6alf1MRtrIytCao31P9aewdYh7DgdRUV6psoximOQhkpoE19WKrzqavZFauBwM2Oi2wEg9GfoK2Wpto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778070642; c=relaxed/simple;
	bh=LfqF+tISQfOqsyRgNKFdDYNR/2LiKpdRLyCLL5bbh1Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JdQzJnUJr10hoaJHJsQgGlHo15k3fSdbE3z5cbSJwnOAFXGeMzst7wuIm8eTgVzbNcDEwJmHPYVi5SxB9B3L13M0emj6vNwycpMd36eIivkx0G+Q/NNG44GI37EL+U12UrGZbdyQb4/uld5tXop+/DUsP3Wnqd6zPvgopHU4GE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BwZ7jbW9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OE4E0lOR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BwZ7jbW9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OE4E0lOR"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646A02XR1985753
	for <devicetree@vger.kernel.org>; Wed, 6 May 2026 12:30:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Z9YRfr3uYhH0pwMTMbyI9+
	KcAk+dbQ90Wa276yiyGnU=; b=BwZ7jbW9m93k00u7M0y+15R3qXcd7AL8RzZ7AX
	Br16rw2DgiCt+zX8ofOci5zDVOa0WPAJUmShO6e2VqHsqUY0IhsKLLY/+3QbN7XV
	2TtmIFE7baI01/D6fERjHLYh9l0PDbWIbjyFXfo3OVXxRek1fbYl1fa+2E8hzffr
	tFPbhPrU4gNY78N0Q9PZXf2v/jWlPoDLwqZep77VJR+REMcmqvTQfhxFm5AHHh6l
	73pQX11Qs11MYv+otHVeuUcbByyNLdhPXNqeawKWUhLI0mOl099dBeMP6njkV7tn
	T8DZokO6tklRFpX04EaaH+3sEJMEazBRYn/u4IjSulok3G2g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e03gp0e9x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 06 May 2026 12:30:39 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51009190feeso147631081cf.2
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 05:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778070639; x=1778675439; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z9YRfr3uYhH0pwMTMbyI9+KcAk+dbQ90Wa276yiyGnU=;
        b=OE4E0lOR1J23CwMvmyI3OsKFoTe35MdtmxJKnMU2Gq5zy4rKWnqIjFGU1cJFaCCFlD
         Y5bBQke7VYeQ8VpJob7vM8D0976d11BbBTJtohrNgvpcERKnxvAcJm0eJT58C6u5E+ZR
         EtY4sVz6SZyLQx8PsplG6DHzy1LMqUKeggBMjXGLdg8LNIgqeD3LIYwj6GIg2qThXI+W
         uxZxR2PZ+H/Fkw/QSl/641VAxeXkCHBVnSWe0WgiPxa9siZCSooxdglKtZ5nmQRK0T7/
         3RKZTrFDkqInfG6cYcie06/JfqBzF7oACXv1tCH0oW2CHIygM5Pg9FveSOCEpc6XrpE/
         H2XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778070639; x=1778675439;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z9YRfr3uYhH0pwMTMbyI9+KcAk+dbQ90Wa276yiyGnU=;
        b=Uy6W/NEqWprakkX3JnYaSIWpB3TZIM94rHKfL/ZEX3BUMzZxmdWAh6RUcz5gUmRonj
         toxu6nruPoyc6G2+qXcvn9XYTioh4qi8dyQm2FMGto2pbdHjszZwg6kENdXfOYBYyBom
         f7xu5wZadxUQu+DH7IZPMJB8Um7yFbQ+YZeZhlu1m1kPqGEaklx3h4nL2j4VDRc5iJ5O
         eNbL9LnFJYYNBNwpp9b2boPGbn1IeaAnWKMdjjI/zUY9NjukXXIClwdu3CQKzvjSi6Xk
         0kR+6wOH+nq3Eru3B/Osd20qAIyyEOprEVXCln+jQKAITQXtA/MTulzlRJC0MrF7nTCg
         SCrQ==
X-Forwarded-Encrypted: i=1; AFNElJ9sn5JfOb72DKF21K6INlkhBWoldJBaRGaZV825NBpE29kkJqMIcuguBnaKHYK9Oz8kGwejSROGYR7h@vger.kernel.org
X-Gm-Message-State: AOJu0YwRa6b6AuxFRJcc3zfk8hG0df22CC44J6m+BZKMGHiTZXGnoRU3
	OcV5n0bGIUq6Vx05M34nhH2uGadWnCj/Uml6IuwMRCxCWOhS7OntUT3Hi2kkUpanW2TFbGk+fkS
	PlQCMbyedXV75v+Jox6tGm6i9j8VqNsUxp/dWlNEnGdYPLO+TLzK6gQaEUSY5Srfx
X-Gm-Gg: AeBDiet1PlGRvKYgXYvWNpTWqqmh1Dq8rl7h8nqWtu/hn/GIeK+pH5he4swXi2vYbGQ
	b249UGnfrksMLS3wy8cdyZnOQ7Qwz8S3aA8DtEy/2yGDeZPox4Dyby/W1Wd7k0yQHfNVBFmpxSI
	2PbyB6mBlBhpTfbveFUA0yw3sM+I1LrvNx8bQE5uSs30736dbrlk5KB1JMpBc2shL/Ldoxt2vMy
	yTorHPxaARmPdkys3/fuGK0drEQyYS23qfwWoyVe346+q5a8+Kj7tXqMdEywR/NSHXSE6s+gTsV
	bbL8/4mmttMeltoqGcT2LTpiNy9zye2WHog8dlB6VxMrQXCOFXwjHHR3ByY8u4aFigJaOHhBBLM
	ajYyypWSoo4GvKOUBb1c4ynokiVddXU3OOgR/G32hmTtbiFgX0YtCg8w=
X-Received: by 2002:a05:622a:59c6:b0:50b:3e64:9b2a with SMTP id d75a77b69052e-51461c28965mr41799591cf.20.1778070638723;
        Wed, 06 May 2026 05:30:38 -0700 (PDT)
X-Received: by 2002:a05:622a:59c6:b0:50b:3e64:9b2a with SMTP id d75a77b69052e-51461c28965mr41798761cf.20.1778070638060;
        Wed, 06 May 2026 05:30:38 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45054b02f76sm11855464f8f.23.2026.05.06.05.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 05:30:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 0/3] arm64: dts: qcom: eliza: Add display
Date: Wed, 06 May 2026 14:30:25 +0200
Message-Id: <20260506-dts-qcom-eliza-display-v3-0-9e46401f467a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGE0+2kC/3WPy27DIBBFf8Vi3YkA28TyKv9RdQF4aKgcPxhsJ
 Y3878UPtZtmM9KVZs6Z+2SEwSOxOnuygLMn33cp5G8Zs1fdfSL4JmUmuVQ8l2doIsFo+xtg678
 1NJ6GVj9AFQ3m1tlKl5yl4yGg8/cN/P6xZ5rMF9q40o6NgOOUjHFf+xPW2a7L+WHRDQ0wkYEKn
 TTCcGdFXs9y5RhNCOmhm4911uE9wnZcSM5W8dVT7MNjKziLzXPAxasuswAOVakcN0oZWclLT3Q
 aJ92umlMaGznpf2mFfE2TiabOrrJOlGXS/kNbluUHqKYLYooBAAA=
X-Change-ID: 20260327-dts-qcom-eliza-display-64de3cfc8a50
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2148;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=LfqF+tISQfOqsyRgNKFdDYNR/2LiKpdRLyCLL5bbh1Y=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp+zRlbNPsDD0lpqidMJIpF1e3e0x0iIL8u+Xo2
 ZcVQeb1otWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafs0ZQAKCRDBN2bmhouD
 162uD/0RlO1xIB45jyvDkgMzmvUBFiAXXhyo6qTwMNuRkWG68ufX7kRrGgWoPpwQg76rk21aq1t
 0qwqJ03okmnbyECHbE8x9Va5U/pMg77oHX1AT9yxz0MB311nGT/ubwRLJjyg2HipXP8Cjuudd+b
 9PWXtIm0xVKBLSjbeRJnLUYbslZq+hbwP80K9fd/68BQRF3nPa1I6wHZNpOVnO4YBnogcSDv09C
 sFMffdZfyVekM6lWjRD2FlUrPf4yVaQ6pmcTTITSj4qIzLx/J0qJmhYxRqAFa8/LwOJlAgPUgKE
 Rcil7TMOtwGci+HvLzFfBHt5OpZfGBb9AKb6VDJ/wcI3eFRjAtT4EorGX76YnfGpOrCdV6wyxkN
 2/uxONqQKETGHvJRgBNeqgA9ynUSgW0RpUBKxHe0g9HqO+ITpPpIyiSqq7LbiopuHb7U+Pu416p
 AG8EVHV9NPXYWe/TTztkjigfj5DihUK9mMTerTPfba+8wAnbzSltCKrHFCaFCTvRCmzHjqPQQDj
 M/X3afdYSjRLbVZzGiS/2El/E+ODTS9Y/egEA4kP7YRu0/QYXVC4NmW2unwLz0aVTycXdnM9nd3
 XjdiIgzn0CMPyD7SMo2srfjt4ecZbbqwVHAcuVpT74vCWwPGf6H3d74KrfYEwYlDsodZqAUtSkX
 IRfaqKeshFsD+7g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDEyMiBTYWx0ZWRfX3fGiLilPlZuU
 MMZoafPQc0JX/0J4voqa0RKtfvrsd4Jftg+Bi9hpPDajAmoPA7neEba2jjyWw4B6pQjVDQkr83T
 T3/pHOhm/DXcQ1qqtEuNw46ErSA+f1bsVVIPfW0DI2ryCld75DJ0lgh7PZPtUn2jJaNtd6DGOYq
 GfifxEDNbGAtu9K0sdYf2xkylHCczohRkwQ4MTwwgdm2aIckPhb9mfp8e0nfCYLLtKzTc7SFa+m
 0NH/8RF+LbieX2nXVDLQ/+MgAeCcxNWlTKdsRF2WyI7ds0zLsFo2xOgrTV/54HdAAvDkACxxiuE
 HZ1Vxp8w02jxWYIOjqgO1b/1BBP09OgzF04NexhUoR9XL2MWKUj2njtyO6LMWsGlOHVHgpX975t
 jxTlb8lnBKPy7QE3k/ryXoq1e2mKYdzyXXk1TL9j5z9yy0ndhnNpHxuLs630t5cIdbWVSAk/U4C
 iFZnnvguo88/TygZ43A==
X-Proofpoint-ORIG-GUID: EjjqhZRTQoP4knwPQXE1MTZexXAj5kVN
X-Proofpoint-GUID: EjjqhZRTQoP4knwPQXE1MTZexXAj5kVN
X-Authority-Analysis: v=2.4 cv=W8wIkxWk c=1 sm=1 tr=0 ts=69fb346f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=lyQqAiOh5yN2nIw2-dQA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060122

Dependencies
============
1. Depends on USB patches:
https://lore.kernel.org/all/20260504-eliza-adsp-usb-v2-0-18e0b0b0407f@oss.qualcomm.com/

2. Bindings were mostly merged, except a change to SM8650 DP bindings
   here:
https://lore.kernel.org/all/20260405-dts-qcom-display-regs-v2-0-34f4024c65dc@oss.qualcomm.com/

Changes in v3:
==============
- Rebase, collect tags
- Drop RFC, this can be applied on top of USB patchset from Abel.
- Link to v2: https://patch.msgid.link/20260421-dts-qcom-eliza-display-v2-0-67f8cf155331@oss.qualcomm.com

Changes in v2:
==============
- New Patch #3: enable display port
- Add tags
- Add CX power domains
- Implement review:
   - correct address ranges for DPU, DSI PHY and DP;
   - add DP address spaces for P2, P3, MST2 and MST3;
   - wrap lines

- Note that DP will work only after adding USB mux, for which I have
  work in progress in github qualcomm-linux/kernel-topics.git, branch
  early/hwe/eliza.  It depends on unfinished I2C support.

- Link to v1: https://patch.msgid.link/20260331-dts-qcom-eliza-display-v1-0-856f0b66b282@oss.qualcomm.com

Description
===========
DSI panel and DP work fine.

HDMI is not yet ready, because of lack of hardware with HDMI (work in
progress).

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      arm64: dts: qcom: eliza: Add display (MDSS) with Display CC
      arm64: dts: qcom: eliza-mtp: Enable DSI display panel
      arm64: dts: qcom: eliza-mtp: Enable DisplayPort on USB

 arch/arm64/boot/dts/qcom/eliza-mtp.dts |  71 ++++++
 arch/arm64/boot/dts/qcom/eliza.dtsi    | 444 +++++++++++++++++++++++++++++++++
 2 files changed, 515 insertions(+)
---
base-commit: 77a9bb0193d790fb71c0edfc567bddc1b56fb3ff
change-id: 20260327-dts-qcom-eliza-display-64de3cfc8a50
prerequisite-change-id: 20260330-eliza-adsp-usb-8ef2b1b0fc13:v2
prerequisite-patch-id: a5535fbaa3699a133dfd13cfa9a2a74b18b46dd0
prerequisite-patch-id: 1b4e40eb33adf28c8b6105f25f6636f82239a962
prerequisite-patch-id: 480c23fcf537d5ae69214f0aabfcef11418d37fb

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

