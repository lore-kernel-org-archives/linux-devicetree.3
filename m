Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9EB40FDAC
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786376537; cv=none; b=k5H0JfXZ0tWWcFBfUXJsBfJy+cpD47v/qGn4gCXw64Rcc6RMBxplzZMmSHX+3H5t1p/Kckm0uKlEGJbxhUB0FvQQhKS/Qi9pCZctpVPFJidKZBJqgo4Xj41iLhEU7JKCR1vlrN2OsRm86H+fry/ePAXBLRR/odAnRnFtnhRFEqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786376537; c=relaxed/simple;
	bh=MxJGfWyqHkmujFHgf6OYxUEmpp0WeZEB1egj1qYnlP4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LvKUwGPDI3GSL0+Fg/fdrJPKqk8KkbS0Lhr7J0IqQEenywVvbtY5mJQluNItZF4fTl1+2S5B7TQr+/aioxqKQCGntnIwaHo42TJn+GFYSwhkGT8pYZmHYmjYxQpPwjWstOJMDMuOIqVJl3zG3IIIKsnHKbZgrSSl8tbwqTFdseo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SgeQAnFQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cVx8epC3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SgeQAnFQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cVx8epC3"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AFWOYd1299166
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:42:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rU3nSZ9YOSVhbe0tEc9W8hDnA4xNDc4U0VkZpFIzSy0=; b=SgeQAnFQ6OUrue2u
	tzCoZX7bv25HSmH3HVJ/IWfJD7HbF1DYSwZePJMGXzZgwip+v6+m38Vc+MM5WYF3
	YqFkaeluIKvLv86RisM56hPiMmENGVHt74MuKokXif8DFOrrMT3Q7A0lJJ5kLxH5
	bi2pG/ltnTFFePNiQ7A3Su6JLpim1S5LKfz/cFvIFNs2KlmzJPDEb1R3BIwwVe1b
	85c041TpnBSBoDHc/9I3PYkyaN9knarA7RhWMe2ZyqDP0EkE1P4LoVKxXHwtTiOF
	j99j6VH3vBnMPfvdxbf4smmtWyFzKHKrFHtO8jJjvX92XTGZD/VpVnUqcZEfbU09
	5ltSkQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v929s1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:42:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5174a236220so18123381cf.3
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 08:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786376534; x=1786981334; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rU3nSZ9YOSVhbe0tEc9W8hDnA4xNDc4U0VkZpFIzSy0=;
        b=cVx8epC3DqHZJzSaPiX+kmUmByU5R05UfhU9gA3dPdJQjD5wWK6+oM6OCjFWnqi3gR
         y2swVgrkRaS+ZoCbDg127MrVPphcDHBkodCdFc8pT/RcaXrYJyuReGc4pR8SCe6+KHmL
         O5M7OUAH/TWmhnLi/PkaH4ko0ZeqdHaYpmy2iDgLSU5Rk+Q6psNMGDaNcoW6IcrchT84
         LijFEKY93rwoqBVAR8HDuqpjmTXuidagxR685pcWNMr6TqdlSiuLhq64LrwB0fUUu8Iu
         Tf8MyEgGlI8+EDaavtxDA+b9L+ntFbLGuOtFjWZmhN5EBcBJq8+ueQ2jYFj8cvqSbo2P
         6Jxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786376534; x=1786981334;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rU3nSZ9YOSVhbe0tEc9W8hDnA4xNDc4U0VkZpFIzSy0=;
        b=jr8nVxOJ67ZUsejpTmkbGSDjjc2WnD0eqIzYxoM3hRVAhlGeP+PeIEkgn4xS0QKmFt
         VNi8RgnQSLbK16Q0SRdfoZe4GCLl6XD/72dNzqx5DsTgkGSbVOUc503Dp0o0uMCD6km8
         pr9v0CnIGam6SLShToSCUzBmXpPHvN5zIiS3aQK2KyEZSn+i7yFYAG9Q8z4ZCjSt1mLg
         iKDzK4HCIlaLi9z/iNvLoU8vyG/LLah6eQa12WPjSfWOvYvV9iCCJTrpqBGXC159Y0D4
         PqGeyd8NQx4+Of/ukBnsVTGUSgUQf/UOLB94N9h40qDfAMQPAveZyh+ZmYcJhAcIS3nh
         +Sig==
X-Forwarded-Encrypted: i=1; AHgh+RolAz+cGwBdDLtLM+LB2PwYJ1Eqih3TAvmNcYDBASyQ+Li2GFLUeStFqm7Z2wgpFLHXs9VKn8Us1PDl@vger.kernel.org
X-Gm-Message-State: AOJu0YyoRx7iPvsYyJumitiv+EAF9QVVD6zk0jdbbWkibvDddgGF0mws
	BcJqVefhCt5Xhvj4E1HxQ8itt6T6tAU4HqQ2DEiNpq+pRI27kJUkU02PU3Fs8cZRA1zfwA66p5s
	Xpi7vTFOE/iBq7AuM3Z4DjMRsbOIUU52HGQj63dR7xP40JEUS6LG329m+ZyMrhCcD
X-Gm-Gg: AR+sD10dEnfSV7Alr5HnrQVb8ym1Dme2aOLZPQurKVRbn1K2KualUqErr1XfEPxKhiq
	m/avwiIzLDarsvVhiOOBvSLaX7CYCgiUlrJZTRJrKstZe9NHx+bUlAPI/0x5c5VP7BlzliJjPPX
	rTh8YV+UgZEcvlsJGSH5bB1DqReD2LpKyCxS6/0DRcd23ohy20wVi8H9ZxYZyRxKMVkMy5fqzNq
	3LAYcDVr+FzN/6ybccszSOer+vi6RDK7CWAEvCl+5dKsp12pb3hQdCJFQ2fd6wGWCAi2ofAtXAN
	itCI3L/Qpw/5oIy3FoBGwyNTRN+oxJ8Dqth09ezrLuXAtrTCyqSxR0fldiIu4uFsMncRJBC3MAw
	shXM/6R/Dqy0MHX1vKsIaQ/Awf/SunudqypI+JOKKMc7JTBukGyOg39wt8WI8baDjMSLzGPTIL5
	PlsUOoWBH2rMXmMw==
X-Received: by 2002:ac8:6546:0:b0:51c:e14:87ae with SMTP id d75a77b69052e-52ce614ec09mr547789131cf.34.1786376534176;
        Mon, 10 Aug 2026 08:42:14 -0700 (PDT)
X-Received: by 2002:ac8:6546:0:b0:51c:e14:87ae with SMTP id d75a77b69052e-52ce614ec09mr547786761cf.34.1786376532932;
        Mon, 10 Aug 2026 08:42:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3056f1bbdsm2071673e87.82.2026.08.10.08.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 08:42:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 18:42:05 +0300
Subject: [PATCH 01/10] dt-bindings: pinctrl: qcom,tlmm-common: allow
 functions on the HSIC pins
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-msm8974-usb-hsic-v1-1-e5f93ea76ffa@oss.qualcomm.com>
References: <20260810-msm8974-usb-hsic-v1-0-e5f93ea76ffa@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb-hsic-v1-0-e5f93ea76ffa@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Peter Chen <peter.chen@kernel.org>,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        Stephen Boyd <stephen.boyd@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org, Greg Kroah-Hartman <gregkh@suse.de>,
        Peter Chen <peter.chen@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1970;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=MxJGfWyqHkmujFHgf6OYxUEmpp0WeZEB1egj1qYnlP4=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1blxwDXx0EKhs5r8iUduX/mB8v1LvJ+OavmxPuvYp4RV
 0xbl+p3MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAiH76x/7OWcQ5nSctTfrv4
 mI2agkXarencdQLBcfucH8opH3VdL6B6Yu3D+7rJic9XzgqUE0u6H8fVZvdvuq6Vd/8hH9M3C9i
 sHO6bTTDSM0wW79xyKCEn26fEMPuq0ow6j9AiXqW509OlDS4HFWvyLBD2/nupL9Kd71Vt4NcLIS
 W+sdGH+WtOeC0oOq6x8WL8z8TIGOZGbwvdHZuM0iq/xzsYyF44qBL/R9J93uYFPd37Vs7aFjZl2
 p3Ld4oulr1e+1fNYe/HtHd7ZnZkr+HawPZILWCpYf2jBYqZRhu0bC2qhbkDp2wTtmharfBqk1On
 UVzZjTPlf2fXRa2ZKl589NmfpsMrdv2UVajOrb5uX9YHAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzNSBTYWx0ZWRfX3VjeUs6F4s4o
 mNV50iQw6TWwPQXJSZXLRRu+SwwpeTvWEdor3zKuQoavfzus1b6M4VjPv5qoqdOHNtFEv/td8pi
 m7CnC2gJBoDckpdTxVoPGBmnkDHHyEQ=
X-Proofpoint-ORIG-GUID: EIKjhUryW_xd7bp9AcSMf4zq32Qbg0GN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzNSBTYWx0ZWRfX7dk/CRWK5DCy
 G+c3RJTMVmnIddKIjZRzNUb4KZX4OtJYiBJdzM79RoHcgKncyTpdZlP9ZCYkDhb+4PnWwbnmAgK
 zi4K8m6nv2e6hRuEvX8Q0jddkTw+OG1s12ppzOsC/7RMRLK9U0HqbZ98/l8X0TE0kWswcbLslpW
 NPo8hZgvE6Z6jFtwkyZzpGHLS6pDDcfJ25omNMw3m5a9c5NdqBziZKBRIoK7U9K5xCPqI8n+y+G
 L69dhvDZQMZ+REcYTtY2T1YPjZHAD3j06+e8QCdr3KcCelkpTuGStHRIDYsRGqbJn4Ba0oMS/V1
 5AVQl8SPHSMFHKdfId8QtWVftUFFmYiR/I/GHHJSYV+xZr9OqAWAxR3Sr6yQZ61PFo0Yqcjg277
 gP15orqjU4m8dBUgdlrjNNDOqOspFXetfagCgHaOOj35q1UKF3fjJs0JXNaTtNcIKIKl08Vo8Tx
 v0KbRymHyvwgLfX0T9A==
X-Authority-Analysis: v=2.4 cv=T5m8ifKQ c=1 sm=1 tr=0 ts=6a79f157 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=ajVk9B4GSH7WaVlF-OgA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: EIKjhUryW_xd7bp9AcSMf4zq32Qbg0GN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100135

The common TLMM state schema requires the function property for GPIO
pins and forbids it for all special pins. That rule is wrong for the
MSM8974 HSIC pads: unlike the SDC pads, hsic_data and hsic_strobe are
muxable pin groups (between the gpio and hsic_ctl functions, see
HSIC_PINGROUP in pinctrl-msm8x74.c), and the msm8974 schema already
lists hsic_ctl in its function enum. As a result any valid HSIC
pinctrl state fails validation.

Extend the function-required conditional to cover the HSIC pins and add
the now-required function to the msm8974 example.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,msm8974-pinctrl.yaml | 1 +
 Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml     | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8974-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8974-pinctrl.yaml
index a9aff442824c..d9178b265268 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8974-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8974-pinctrl.yaml
@@ -161,5 +161,6 @@ examples:
 
         hsic-state {
             pins = "hsic_data", "hsic_strobe";
+            function = "hsic_ctl";
         };
     };
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
index aec72e8c0621..e10aff02be89 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
@@ -95,7 +95,7 @@ $defs:
           properties:
             pins:
               items:
-                pattern: "^gpio"
+                pattern: "^(gpio|hsic)"
         then:
           required:
             - function

-- 
2.47.3

