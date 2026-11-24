Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530585;
	b=yDSgy4qMZ3Jm6dzyHMnRT/6AGSVCxXtOhxxRl7AfLUk88VTAi13tbbOChE2wqlvWGQrc
	 /ZgphA+m8AKwadi8RKyGGaNoLq8ziUwE/aNrzEWn+BGEozHKiUX6D44KA9OTmuKLL9cS9
	 dHrO+d+D9u1484ch96LDiZ3x4nX0xFLa6UElwp3UWw8NPJqATzh/CsfKmJ5DoUYiuXCXW
	 mk9y7yfNkkORUr/xxm4/Mp/Zd0qIyiAyRDzRrXxdpfcGWeOL5BMJ+uvSaprt6HWZlaT0i
	 GR7/vGJzbyTdfok8UW1maqgKaq+gnqPh2Ni5BUWOIm9ltvszVsijfEeHUt/Df47151g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530585;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GSdWY/O/F+Ype5FZFnjwSsiuRFnCFUFO39Z3b1DQLTE=;
	b=edwlyVgYS/2cXHPB74FJkeZQxo+NxY+Qd/1CVT/tLtKcT5yz2pT1nf65ngdtBCwyqo2z
	 uwugEl5O0lq+bGynEJ1RpBKdfhdfLsc3WBlEaFeMTk77nUitXPF3TlGAGKqhyVnd3b6XU
	 +TBQHG/O/6kI9S0wzdw1HKIjoOvMCc+Swr8kPwoYHohEXxUstLCbqb/jQuTVZ3k3xhgs6
	 Ry4+BCJKQGumyrczCWxYzJ2Nkg03QTV10XqHAxicHeVDA443iuvbo0nrkDLBFuKIjfHGS
	 /hkBBwcCYBr+jUiyDl6Lrd5egYrfrKgql9qzrMcI787DDAHDxkarwLsDhZB/KVGGpCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bXUQeFJf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vgz48zAS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFAB606A326
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 14:29:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABFAB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bXUQeFJf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vgz48zAS
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOCDPtC2848993
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 14:29:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GSdWY/O/F+Ype5FZFnjwSsiuRFnCFUFO39Z3b1DQLTE=; b=bXUQeFJfbj2f4e1U
	P+Ds0+blh/H8EN7ngl2o74co5O4j1SArwoL4CM9uynXCuk/WUWn43tFDVEvD6NRc
	clL6B6OOBy48CKFdvqkYFeCG8KbBf0GTYryZwm0+9yyfiqW0Dfyb75lh7ShfUJyR
	sjWJd7dDkkW/45zynh1N5LM7txxQ1bPWKoI+2P7kIiTxqThmX28wfO5lCokACZa3
	yG5Tu4dYZ7S9bK607/YmB5V+0cX9tu1+RUG6BkMz9q+FtGjF78stmgnmptKo4/+G
	OwPqqOq0PWZHu7ay4RKkw3/Ab6SadW8MTvEt5uCrONOQau7CNkS476V7tE2RZyDJ
	uLkwtA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5ad7rmpb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 14:29:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94961ed97d6so811004085a.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 06:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795530583; x=1796135383; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GSdWY/O/F+Ype5FZFnjwSsiuRFnCFUFO39Z3b1DQLTE=;
        b=Vgz48zASYs72vvBVQYaewZvS7MUDBJAXbgTpCTfBAslc6Sg2KfA6iKeXQYEpC9Cy22
         m6/DG7TSjzivOQSWTJbXLcX7p0qH//XP31H7S0eiQssvHm0EWCerqOY2GLWKD+eOqz2j
         RZkGC9C3fqRCfhZ+p1TS0KJEJn9ZswH89KLRdtuIx9KPTJhbHo7CuH+hsIP3IUxFGXJy
         l8c9T2T7tSH9YLQeGZ5xNd5yRbZCDSSGnR8jyDWciP+yeqFt2Razej8b3FFFicizsyK3
         IL0uB3gUuOANf9tvHU2vIKeOve8OYrpEpk/X/KCo1wMlCAvOWKQbfj5bO7rwolhVHuwS
         Cswg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530583; x=1796135383;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GSdWY/O/F+Ype5FZFnjwSsiuRFnCFUFO39Z3b1DQLTE=;
        b=KLnkhQUR5R76mM9cg9lCAnGr6ZeuIs2xFDMwqgGqLIcyeOMUYMHdTYJiPAbFZiLOkW
         pNLAR9shQ91S7/WYVujRFjCUQTWMqp2KXqnFQfSVeC0eEwMIsduHgwwjx1ULzWDg9bCb
         WUG1FgqD2gwV4i8h+iFvU9PWlNofjLd8fouJST7Zp7kTa/iq/MT8gn8nM3WD6+j2MvjU
         iMUbbwvYZ0vFXGLfiNTSt4Ub14xT0XLRKFqZt9zhLu1Qpkf1oJsLmlYawjVR7xZeceUf
         RU5Zb2H0FCWzEH3psBF66j+X9wZmsWVGT60eKcrIY2XUSbhkbYQrGTjMnoRnqpol9tmE
         2QNQ==
X-Forwarded-Encrypted: i=1; AL+hErHqwkXFuCmWxDWWZYu0oND/zQh97HLz5a/aDiqu3oogunRa9yyU+V0YQ9DNpttYl3aEAMEgelmkq9CJ@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ae4fN2W3vxQrwyl8Vo1jliTba6UgcrJHED9AgTlLu+ystAPBQ
	IwkjdsVKfW9C4HwoTCGi3OzDRZpDHtqJCgTRsnlOh8r0uUSs0/vil4GbGs7twIg5yU0lulx/dFF
	YDGNzJqBfKcOXfqdS1iiEMUgX26fexMC6yCMN1L9m0HtqU2KcZZUtYF0EOO20k03o
X-Gm-Gg: AZFdTZcvcmrwBeUOYeZ0DaAOWG3r8nr5W2329UlaYLRaTjOuS7BVeZ3bUkLht2sfNaA
	4hkhroiPdZhQNe0Ci0hN5nOoDi4hPTvteCyL/cvdkDjVqphBdZgIa/Wl0TvSeemfTmE9Emk5TVU
	Y6wNgTcKZD60KCTRQ7kgqwQosJ6psYmzAeBMpIPA6xFWMGrlC8M4eoHh4hAFIUCpudY9sKHPsCd
	iWQEo/HNwJnNUthf0SsC/2KdEjKtIdEEpqI+gqiks4Bg3GziBE3WGrix6QSuPZoD903QCYjyYsN
	YZRkcDys9Q8UUjQU+JaeHXmLlnwa1G6ZJCazMIiy5bWFqX2qhz9fIfHiV201qPjfnGdocAh30NL
	XB4PbDd/nXvXpSUZmugfyXDJtWvc/iqFiwFbsDPn7BhvC0U0IfyEtIYDDXVIXU/DIFtQiE6evSU
	bn8O1wPk5UtSTU5WMWHTrvUrzSkQcPjc5MZ1oCH/s91+F3QBX09gx4o/1qBgrdGZQ=
X-Received: by 2002:a05:620a:601b:b0:949:692f:f4ed with SMTP id af79cd13be357-949b385b33emr2380190285a.43.1795530582930;
        Tue, 24 Nov 2026 06:29:42 -0800 (PST)
X-Received: by 2002:a05:620a:601b:b0:949:692f:f4ed with SMTP id af79cd13be357-949b385b33emr2380186085a.43.1795530582331;
        Tue, 24 Nov 2026 06:29:42 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b34e9c3ffesm12013821f8f.19.2026.11.24.06.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:29:41 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 15:29:25 +0100
Subject: [PATCH 08/11] dt-bindings: pinctrl: qcom,sm8250: add the egpio
 function
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
Message-Id: <20261124-qcom-pinctrl-egpio-v1-8-34f2c06b2658@oss.qualcomm.com>
References: <20261124-qcom-pinctrl-egpio-v1-0-34f2c06b2658@oss.qualcomm.com>
In-Reply-To: <20261124-qcom-pinctrl-egpio-v1-0-34f2c06b2658@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Sean Parker <sean.parker@viasat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Stanislav Zaikin <zstaseg@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Iskren Chernev <me@iskren.info>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1571;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=tnE9XqfoGbUNSlUyMfczo9yXy1kfZ1G8Psly9oKVopU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrBZ9DG7r6FBIskRauLXgGUKtnXuTs01Xu7DmYv
 OBwzYtVKzWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawWfQwAKCRAFnS7L/zaE
 w0iBD/93UWvXOoR2tPYlV5NMkibL4dOSyctvZz+dKVZ5LiwaTw2cQLcUK2CVnifEsr3nrSFjvNh
 XR7+tmFDgEv/S0uZYXaVrljXYptCeuS02vZ2OZvi3REbWDBqslHWnnTjunkq2qZFjLzvIXqzLIR
 1xIbuNXzTTXU/3zHp3AxiFRomtU2VoUdkdANGLTSuhtm+9KXYMpNd9lD64keZ1AOCYO8WGxFP71
 GuLmvv7GgroGL5LISBMjrmGV/H9eh2sW3cIOUjB8htyl6Fjo1bkzqEPqpTtALV39bi+hdg/3en4
 28eHDBG3BSY5prxVA9Kn4z6YddiO8yTj2gkKrbQhRW8pOKhTKy239iFBU00+8zcy6Lp58EccQCk
 lHKW5H8/e7SONxbnADPQ2DQm29PzwlAJ71KscPY8zU9vzaRm4iDS/GPmG3Cn+7digzsQ/S0bsvc
 kuNbJVnDkNmH4l597GuEgrfYoV55arBbWLF4uP3MSIg6eK3uSVOm+3WGUBt+asmZu3mP3X6K9rR
 NOieUTcZufwF2s7A4fUdTfCCD5qxDg+UTAa3YEPTKHiyome6D825WnaxUehIEbl9f9yo17+2UUI
 v2xkt922aljiKIkWYT9DR5Ixv7QsFoXRTvoCEndDdzt4Q31fRMB3ySIoiyXy/BSwXYY4O8Ic4xT
 gVcLQ3+Ls6HQRtg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfX+Q4k5kpNC9wm
 ncUimB6fo+cSySfyBmZJGxH7hBeKgLDA2aQAUuuCejNagr0I5lIkuB3ZbnktuRq5cJvaRlGlugC
 Gtg+f85C0Q/PoI/XjyUafx2gclMR7nw=
X-Authority-Analysis: v=2.4 cv=cI51IVeN c=1 sm=1 tr=0 ts=6b059f57 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=2Hlz1Ra-QEqM0uTCcOsA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfXzzZbTdEjl38e
 cQUv62Sp8Kpa+D9JziVxUO9XPVXAWlUNAvFxhEvIYr9BGvP7rYDDemuaQKJ26O+/kv9x4H9k8Se
 jsKmUO1IF/Myf3HaytKXY8ODnGq+9ZsuJ+M/8g/z6UK7Zzaei1hOQPeLfnlk3LGfoSewELDT08b
 eoE+LLLTY0UT5c6NwWnAxlG4DjAioitz77BN87O9q4WQZjT2P2d6cQ2nF4IaN1mUcFwLWkMpjKZ
 KS+liCeLLY3lLLqPcl6EN2AMd4vG2b/ZzR1USY4xhtJyfNhXduZDxDcFH2Cotu0pffmezV6Rsrt
 4k6R0co7dYe8kUfPuUWSmX2yhkJEZCp31BfaRrH7xUE29dZiOGRc+/n8Oca1HgR8xps+C3bdu75
 qgJoIgzEskk7wPR5e+xY9wQxRobgjwDffZOqCI3PhoLbghkV1EjrzNOaNow9CzhhKcWXFdSbkHO
 iK4RcZNIU0QTPBqjIgw==
X-Proofpoint-ORIG-GUID: xkD98U-AZCRcbB_zOQ8cJxplCocVfeLn
X-Proofpoint-GUID: xkD98U-AZCRcbB_zOQ8cJxplCocVfeLn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240056

The sm8250 TLMM driver supports the egpio function but it's missing from
the binding. Add it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
index b11edbf8bdc05739a34207be561c49c95c64f221..482d98c406bf661788c13ef360260a024a90c2b7 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
@@ -73,8 +73,8 @@ $defs:
         enum: [ aoss_cti, atest, audio_ref, cam_mclk, cci_async, cci_i2c,
                 cci_timer0, cci_timer1, cci_timer2, cci_timer3, cci_timer4, cri_trng,
                 cri_trng0, cri_trng1, dbg_out, ddr_bist, ddr_pxi0, ddr_pxi1,
-                ddr_pxi2, ddr_pxi3, dp_hot, dp_lcd, gcc_gp1, gcc_gp2, gcc_gp3, gpio,
-                ibi_i3c, jitter_bist, lpass_slimbus, mdp_vsync, mdp_vsync0,
+                ddr_pxi2, ddr_pxi3, dp_hot, dp_lcd, egpio, gcc_gp1, gcc_gp2, gcc_gp3,
+                gpio, ibi_i3c, jitter_bist, lpass_slimbus, mdp_vsync, mdp_vsync0,
                 mdp_vsync1, mdp_vsync2, mdp_vsync3, mi2s0_data0, mi2s0_data1,
                 mi2s0_sck, mi2s0_ws, mi2s1_data0, mi2s1_data1, mi2s1_sck, mi2s1_ws,
                 mi2s2_data0, mi2s2_data1, mi2s2_sck, mi2s2_ws, pci_e0, pci_e1,

-- 
2.47.3

