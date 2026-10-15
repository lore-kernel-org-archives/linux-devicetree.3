Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34075304D6
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 14:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792074248; cv=none; b=lE3qpJWjNR4S60V+fwdsO4F9EWr0iZe4wDBl6Fmqwi2MawNaCJUuZUGS1xa9e/h7G3pRNyrYuETZke7s3/kjNLtpWGM5tqhp5cMn3F8kTKm4zv8x74oUIk+nXTo72JD1GP75+e9CNtUF91nnOGgAReur64kmY+ABfXg4FwsMefc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792074248; c=relaxed/simple;
	bh=mq9rEF7t+ayaQwPKjrARpnKTkdqnGpDbd/zX7wA7cRw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m3FHBhYIW72a/3VDbtsJ3TAKW299l7U4NJMgCOOgxw87PXISDiPB00+VnVpiBo+1dR1l+ak6y1UJ3SMpAYct9utfRkR4EiYIUS+yiL/kfXCfOuNpp9dLGEHHpQzmuZRS7KVWop54RYNMK3WHwo9StD5Zxq7is04iDjSCqR4gGC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nndw5mpD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vv29r0+u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nndw5mpD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vv29r0+u"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jVxo2416857
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 14:24:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FrZXCD3PHsI+MdTKLYNfSCMuzb2ii/BEmeVwGG5BOEg=; b=Nndw5mpDjPBn483Z
	v3nFokO/xnRH01UKlRSK/rM4IsPJHsprulwZDnIoDUyf4pX1cftCXxuTIMs9Qx0H
	OpgUVaz6CAg0YlOgoNItzg4tBkKQVXZk5p0K2ZpvFM5YyYfWgzW3spITH8tE6yen
	wA3X+3MwTV364wduYrhIpCyyF70BAuBDC/eOuaoDpj305iMHPGsZo2j1vfvSEhWU
	0o1AHlCFxrQbR+wwSbWBSD15OVUvZT1UGsTD5J6P87YwgbWbCITmhfeZ4RB3DSLl
	jCtIlJbPAcTYVpW8nNjfhEQ1kpaxq2KQKw7dbziXFjBDN0t8axDHjDl89zNfNaQP
	TFYniQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqdhjhx7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 14:24:05 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35c3c370b17so6032346eec.0
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 07:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792074245; x=1792679045; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FrZXCD3PHsI+MdTKLYNfSCMuzb2ii/BEmeVwGG5BOEg=;
        b=Vv29r0+uSPoIeOZRZEc2uz7q0pxWimFViXZ9OAh8IFYYZNAJLHS9fGfyKML7Kjs8Yr
         49e4wPAl6A2HpSOXV/8Z+/F4vkzIvu4PwGlubgLAG3daF9vBdjnR/UnHEtnYW0TbANN/
         PAgp2FFz+1QtTDH+Df9hfhCjZG9ydjAlNU9nuj7y6vepUYqBg91kkedaHzUTDCvV7Plh
         tuf4931GTB65mlZgty3Kc1fktN+SmvJ963PWxU8tA8Y+FICrhYRHZCIhIr/9VLhLXMm6
         G29tsfOjZamYTaGh97KJEayLhlvHrXcI+5ozWaby2pYIOf94eK6vOEe5ZY5gCoFQfn0p
         4V3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792074245; x=1792679045;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FrZXCD3PHsI+MdTKLYNfSCMuzb2ii/BEmeVwGG5BOEg=;
        b=c9kp4hZaWI0C0Epi7FXAk8iKDc8ihKfpyp4PcoqevZMXOFjIA1w3Tb0alLKtYZfpyB
         NDxK3aEuq2eOEPT8HMHDsyqBVtcDDnNEsf2ZcanjM1RfS3AiWQXeesAQ01MZHl9H3UKq
         urmJH/1uK60TvDXbg1jPO5sGluos7Mhss1sZNeUxYdMDKT96Bg/ZkKMrLEMCuqdhK2qg
         fyHYuIxknH4+KkftiKicHJF04x3WdxKG5XOFMmmqzG2C/keyFbrrgoB+Et3loNTpSbAF
         rDzw8tRvAQtM2C+ygOBUH25a3ezjBoILuopUjSKl4ly/NBvezhKM4AyzpKIH922qJSka
         3RQw==
X-Forwarded-Encrypted: i=1; AKwUvByljPox9F/iuPIiW1JQ9efmB5nR5nCy8SX28liYvDE9b08GnFpRw8Ag6dLCdgCrp7x+snRcbeC/+yAR@vger.kernel.org
X-Gm-Message-State: AFq9FYIgjD8DswDEw5me1uBINZew8hFeHEX5kQVSkLj5015KZ4hIQ1k2
	Kw0A5on0lkThgu+b6W4oH5dOPuBob73OuQIF44Vu/ybbb1aeqRPJXB1tq+L/Z8ItzpZC9zdrHDQ
	zUXUt0laa1aML7SlA6GTbADe8Hi/rTUa7FFA3FGxb7rs9qTYYJUbKDGVtHjomRX4ufL0Sd3Zl
X-Gm-Gg: AYBFou19rtiDN0BfCofMKGkxkyHlPt3HqV4o4XpgyKKSYOanCPef1yf4j9UcBOWTPR0
	UgIQcXHEt6uCFhTvGwbA8x0iZfIvdj0sYYOn8mrcNnwIEBLk/8M/8c+Z2OW7yor8OUMU7JYSfLk
	SVM8NvBfZjwPM11fckwRDfvM4cxrX5kq23ALPuB79hI9wUtkOrqX26TGTIj/zv7pzIxoPc2dgYP
	Zr3uafks7rS6wM6Mw1/AAI+XqyzkhHtD5o1suDopP0ucb2k7dH3RlxW7+mVutMsW4PlIeOOKzrn
	qZV3umzt/DyAffuPBo77fIzZKMm7IYmTdzIhMrVunMXwZcJQg0mHwK4Vg86fyN484RZR4sopyAR
	HIMio+9G67K1p+VzI7LeKvtHWWk9Xu8caWk0=
X-Received: by 2002:a05:701b:4211:10b0:14a:a6dc:9cd7 with SMTP id a92af1059eb24-16a57a16ef2mr25815028c88.2.1792074245128;
        Thu, 15 Oct 2026 07:24:05 -0700 (PDT)
X-Received: by 2002:a05:701b:4211:10b0:14a:a6dc:9cd7 with SMTP id a92af1059eb24-16a57a16ef2mr25813448c88.2.1792074211417;
        Thu, 15 Oct 2026 07:23:31 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-17dc865cbffsm22921139c88.6.2026.10.15.07.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:23:30 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 19:52:59 +0530
Subject: [PATCH v1 1/2] dt-bindings: pinctrl: qcom,tlmm-common: Add
 wakeup-enable
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-tlmm_wakeup_gpio_support-v1-1-c6d6f37a7e51@oss.qualcomm.com>
References: <20261015-tlmm_wakeup_gpio_support-v1-0-c6d6f37a7e51@oss.qualcomm.com>
In-Reply-To: <20261015-tlmm_wakeup_gpio_support-v1-0-c6d6f37a7e51@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792074202; l=2259;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=mq9rEF7t+ayaQwPKjrARpnKTkdqnGpDbd/zX7wA7cRw=;
 b=FOBgz70IKuMobP9CO5V242l4NMyi+psI4lueJUV5e32urGCGy5yzg3Bu1le31B40XYGC9lwSI
 To8GoIm/ykBDe1LSWI259wD32z21qPLMDXAPClnL/oAcySc0eF29Xzx
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NyBTYWx0ZWRfX7INiFI0yMUnf
 d0QnXropppx8FHeef4oOKKxg1osW0wYLd7jhhl+qn7Wf+ZbKMcdhLzlywqQu9NNsdwvFvnD08f7
 6GuHw1tCzpT7MmDqankOtpQsFrXpA8bIFUPF3mN38Tpc5Uo1t3ggCvKxPPQzdJzrCnfJGBUisU3
 bWjF2cQd6sLukwmA43q0NIr3Lfb/Kr8LBnYQqu3WEWHeZbKBSmyRSebMIm7P3/UwbMekr1Oywpj
 /T4QnA1AYHFcGepFtaqMOnryiqZa53ad+zVUbMVsLB9XPH4QvncSe0/nvR0aICt401+ug+y1z7J
 Q5qklhFGbu+t2ezI2SbWSmVwKiiptcYHGC7TCdYktSiIpAtm9sdbZ8Rgna7Hf15ucHuv71HOYvF
 TekGaacHRcbPsIEnIDeTYKDfCgMOcvp6uXWPmFqpNJoaOI/cizKkRp7W1VHBLi9ThLbT9fJFuco
 GHvKQQx7s9vrH7hlplw==
X-Proofpoint-GUID: ifP0gta3mEBvLzqmkoXMO9-SLSwSa_x7
X-Authority-Analysis: v=2.4 cv=DeeCOftW c=1 sm=1 tr=0 ts=6ad0e205 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Q4uxw_U0XqAMYNGLDEUA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NyBTYWx0ZWRfXycEWzKgC/uLR
 YqjSV+YjRJFx2raQ6LO2WvP0OGp6fE3iTnwP7NM0PiQsLznSZeKfKGgRzlKuUP1t1bo8cDogU1+
 m6pmK01gs+bQZMjreEb5OdGU37XIRPY=
X-Proofpoint-ORIG-GUID: ifP0gta3mEBvLzqmkoXMO9-SLSwSa_x7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150057

The TLMM can gate whether a toggle of a pad is transferred to the wake up
controller (PDC/MPM) while the system is in a low power mode. The pinctrl
driver arms this for pins it requests as GPIO interrupts, but that path
takes over the pin mux, so it cannot be used for a pin that has to stay
muxed to a peripheral function.

Such a pin exists on boards with a SoundWire codec: while the bus is clock
stopped the codec requests a wake up by toggling the SoundWire data line,
which is muxed to the SoundWire function and not to GPIO. Unless the pad is
armed, the toggle never reaches the wake up controller, the controller is
never resumed and the event - a headset insertion, for instance - is lost
until something else happens to wake the bus.

Add a pin configuration property so such a pin can be armed from its own
pin configuration, without being turned into a GPIO.

Assisted-by: Claude Opus 5
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 .../devicetree/bindings/pinctrl/qcom,tlmm-common.yaml        | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
index aec72e8c0..95f539611 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
@@ -87,6 +87,18 @@ $defs:
       output-high: true
       output-low: true
 
+      wakeup-enable:
+        type: boolean
+        description:
+          Allow a toggle of the specified pins to be transferred to the wake up
+          controller while the system is in a low power mode. The driver arms
+          this on its own for pins requested as GPIO interrupts, so it is only
+          needed for pins that stay muxed to a peripheral function and are
+          toggled by an external device to request a wake up, such as a
+          SoundWire data line driven by a codec while the bus is clock stopped.
+          Only supported on pins that are marked as wakeup capable by the
+          hardware.
+
     allOf:
       - $ref: pincfg-node.yaml#
       - $ref: pinmux-node.yaml#

-- 
2.34.1

