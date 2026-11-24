Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530572;
	b=nKANWuwPJ/a2ThHfCJRFThIPDs+ddhQiLOIZIr7zF5SV4Qmmv1jRaDtlOYmxaSsxZKv5
	 qHdjdca/vx5AM/xxffAh9IHEk2uHcjSMNvcB1ywpTnUIqHCihCGr5TOt+/JwkKnbv9ba/
	 zRdgcUYeu4JekNCOIAT2cBMHVxfYnBmgKUV7yHmTCHgk3i1DbSKnnI8gDRcrWzN6B1xY5
	 hJ15a/ECgkPD0VWkk/1Nz5AJdjNg+tJo9LXWJz7Q0koqdBmXvthDwmqIUQWcIAnzz2Wqk
	 V8GfXXfK/waR07qfhXsC+erp6fjsILkwEPw4Gb4g/1G3I0nFMckw9Z89OuaEBI3+ryQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530572;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=IgOw4S/YKKSkgXu8zGtaSLb8x75hEgzqlSeRCTv02xo=;
	b=ysWvH6tuv1eZaUqG3Pm0gRhkXGDHrdZi2bqUt5u/lpUn9Xda4i1DdRvGsrrqC9f5S6Ws
	 hkvxNc+k6VjiGRvBUYgKBgKtPKQMQQpkx0Byf0/VwcNHo/QZfJlRdbBwizJVALG2ZASE0
	 IddWA9LVtghvrmERLHPnqt2QYtmITrT7MobD6vNfgGLtmdAswior9gowEM775GLY+stQu
	 +Z/sVBe9rUjuzLhYB+PDsLtZ1GEySfRJjtM7s4xC0LhTvUZXcQ/INq75L5ImfcCRGZxot
	 zGSwKSnIP1E6sqGmuiK02iFubpA3gx2W6Xvzj0C6gabdDaK3Fs0cJXIAMyv840YrWPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kVpTECvS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ad94un+8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B636606A332
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 14:29:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B636606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kVpTECvS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ad94un+8
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAupDB3299978
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 14:29:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IgOw4S/YKKSkgXu8zGtaSLb8x75hEgzqlSeRCTv02xo=; b=kVpTECvSs64/Obqs
	L8KudiNXFPfu3gqyBk/48nCFs72AyHc5J1CbbM52oDrCm13knIlWYXHAaQdqIVue
	VqEV2MO08ksFLXPUYmuJK38Loa21lCtc51Hv66kSuPX1uHjuxirJxVixsgKY3VK2
	yBfGpNB31L3kXfDi0mUX+dhhCUdyTyFgj9D2Dt1UK2Ugf5xduae/F/dhyEJCm647
	5YhfOm4JRgBBpF1zu6hbZD5vIkPxSxp3uEB/LQrgb1RB+oP4ARbk89kgYpw7OAv0
	wtM9Ov1usT7GnDSadnntRVb8mucyAjvJ5XMaVH0fb2YNH83d0VgefOhEVcLYmCs7
	UXR4cA==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yy139sw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 14:29:31 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-67dc4e966b5so4497399d50.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 06:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795530571; x=1796135371; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IgOw4S/YKKSkgXu8zGtaSLb8x75hEgzqlSeRCTv02xo=;
        b=ad94un+8YbLkfizTAHTEyeK6PVhxe+xL0vA+J55TDjNPemRXae8m2UyQ59JGhzvD88
         8OvWrxFQBR6GMAkPvABdmvZuCi2yHzZqBhQBMPDCs5kE8ulllxs6VQuzKkQne8xsjt6Q
         vS92qfHqfz+JDrTPx8xvwhX176LmsoN8nPbTypwLaq2GIdGXnroo91lh+TcgahStsMNZ
         RHLA8GDdCpZu9fNBW5/7ZrCYenvvN+4fGNaUF/52ZC82LFZwU/g4enlcW7xDX4/oiGhI
         5PUjtqBWNzk9earnAJSBqI24Gocvu7DVUWTdk0cVP2IetNhu0XaUpNF+r5u2XCNdKExZ
         lu+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530571; x=1796135371;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IgOw4S/YKKSkgXu8zGtaSLb8x75hEgzqlSeRCTv02xo=;
        b=doKW+wXROvAH5Wg3FmO8THer/pMFLOZUyMIy3hkDNcmRLU4kCafSUKsOyy9CBqjtR+
         HXhatEgYLuIsIo0pjS4Yz2ZPnaEyGHJMbkz63Uw7xCMD4k4K0+g2aw2g6yBGOGQNLzjY
         dRJSo4k7AOJaFUUYeRkgL1zx+ahGGmA/UaX60XRNGt/6fhD9KjxlLNp7QyWkV30Bqg4J
         uRLQAcTaJw8q/zAnIY0qWS7s/nidfFnRPckRcOeoJxRH138zHpq7WqbIzAfpiqccr5dX
         dxpezITdCkTE64KXFdkCJ0xpXKcpQh45G8OTyjCTJpdCldOusTCoXC1Kfo5473Ky6t67
         ZeMA==
X-Forwarded-Encrypted: i=1; AL+hErEG2/I7Md/ywPBIaWubM/SthVRbPnpeSWKLdDLB5kSNfo/lF3s2s4ba6fDKeLHc6UFRbj4kM0Dqk5+T@vger.kernel.org
X-Gm-Message-State: APuU4Z/AxY6VEWhriUl8+c8KMXuSkgYGM7cFuFJtfZylAtEixNP2uWYA
	NkpSbcpxROEnXKyScaADwjar1ytCMxJQ8biwmLsCW9oCp8JXUCFO2Yq6o+JEx1RfeX2vclGD61Z
	1EzTyDL6SI1yzkxUPDCcBcAM3ruoZ62pGI5n4vbR7nBNzBV/WJk/eiUSKUWYF2yYm/Hoe5fIg
X-Gm-Gg: AZFdTZem7tP6yQKEipFjTMAI1yJhIEOGBy2YZrjUhYbill1+R1HkUmv0zLDGMTN1Obn
	pWnGwr+UijggXX0+TDQ3ezNM7K+UCTdkaS8jiKOf6CA2ZFX0r7ydxhnwE+2O7NoBvLlIbP4bKZY
	UTlRZWup5Ddesg8KicLuq55WTdl/ZFac4W85afvS2NuZUMzpfHZJoI1CqE5srUT/i8Yhv1Lvhkj
	kt0APztJAal2OTNYH5qMxQwgTPhs7pJb/kwjwvK+Cxky3auU/o0YdyH1R4jYvHgmmSCDNB6oQ7N
	XU/Tx9XLP1OxCGMYzUxpnuPeWSyNdYcZoB3+EWYHRAI9AznD26ZwMcpwl0uirheJ2ND/FgEcqMX
	k28awqTuXFc4NnKfGUHSIW96z4yIpz/DOs5FumkwdpjN5gVwywGCwEgSLkkTTaIbNZwKu74Htc4
	BVb6EAU/m7/GNdVittXReSGCV/Q7KooLR87ZfpaLaR/GIAnNxvTNDDJpuyxzIPj88=
X-Received: by 2002:a05:690e:128a:b0:67d:b729:eee4 with SMTP id 956f58d0204a3-67df42baf2cmr6444056d50.1.1795530570573;
        Tue, 24 Nov 2026 06:29:30 -0800 (PST)
X-Received: by 2002:a05:690e:128a:b0:67d:b729:eee4 with SMTP id 956f58d0204a3-67df42baf2cmr6444035d50.1.1795530570084;
        Tue, 24 Nov 2026 06:29:30 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b34e9c3ffesm12013821f8f.19.2026.11.24.06.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:29:29 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 15:29:19 +0100
Subject: [PATCH 02/11] pinctrl: qcom: sm6115: mark egpio as a GPIO pin
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
Message-Id: <20261124-qcom-pinctrl-egpio-v1-2-34f2c06b2658@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1113;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=6L55zPWwXoWKqnOEiZumw3Qxh5x8aXSZJfNQ2TIlUOs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrBZ9C+k/fI4eyCOqb3VY6O3SvcmiJaMnmzWgEy
 15wcRfgxsuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawWfQgAKCRAFnS7L/zaE
 w0inD/0R2AsSV48q45DDF/zJTtrXQ4BVrCcCko8A9Mf3tIW4tVkuDx9TIoxiS67MdmKJKiNBRtR
 lTq5Q8OiFmbFVcu1OpvhRkSndpD0EBY9r6t3fY0khmeyB/6h3M/a1iqS2zT06ROtkq9uhIlq/bj
 ly5r0me74gXQ7o4fw6M8C/eX3FsKQ/7fyxbwYnZtzgP+EWqJz7OID3PcTVfm/Jzhp6KuV34Zcse
 b2XyzSag6asXJOxz+Z4cu/qPJmEtzlwEJmuZKpPKK9Gk9XaC9JHx+cjIQkmwUjCXts+fOAodxMb
 d7v8JTEVIglsgba+oa74QIfNgm1ZiGFkAxeWgbpZqy5E44PoFQjrwyiyOrovE1qY28UuJ2ORqGU
 etC9ejWeHIwMNttThx9/j/2HootZuWYBxhFBOYAwr8mLgnzEr+01fJJiM14DhQ8XQCrqaCvWeUn
 2j0+Gowd8bC4z7t8JDZMWE9LXwUG8N4mLVb+7fUFcyLRbT06948XODTuBNFhWEgfUkk/gqtdLPW
 IX/gHR/7pbjuEKiFbWilYikN35+zGHZFK968FjK/WLNJUDoOSAgVNmrxsP0z3ylS6kPIzm8u+Fl
 CqNvENRNSgxcmSzPbpTwHnH0I1vnxChoGDD5ZOFq97GhW7Lyno695jKFAh+yG8Qw6IyL3kdJ7n4
 /MJjUwKwtSrGJmQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: EwI0wHOX3e-4dulu00ojoTIwehWk1I95
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfX4EaTTZMEnJ3D
 x2dDbGC5GytbWkVOoaVT2e09pTcBsHTsoCPFTugv8BvTQcakLGoLqe8qB9hw4HKOPZesWz3aUqL
 e3YrCf/OemudLWlyLP8D2+jVi/RWdk0=
X-Authority-Analysis: v=2.4 cv=JYspPkKV c=1 sm=1 tr=0 ts=6b059f4b cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=8nAbR0bechdim5sVv1AA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfX7vezs7Jn/qhC
 Dg1+NhEzt3MR13/vrc8xEkWcON5IiWW3e4pglMvMJ8vNHnLvPy/CAAxmFllnFpDWRBPWw+mjSZ3
 iAoOwUit8eisdZ7QRv/OUuFo8oEQ2S7DtYfDOOpL1IIC7baTqVxLWMVaDh1RfB1sP93JJq6WBW+
 8SWSSN1xwDGX/Yaid6Lsz5diTMc4d+6zWYaUjeMrCRDe8c3VD5OCwwnu7mE9+n0hmS5yNB5v8Pv
 Gs0InWrpTdi8QBPHKA7/rYo7R7rSHRtngT6zBiedRjn49Du2HEd6q5c+UpViqluueZYB/E8Ol0g
 6PHCVuxSDFjBz6slm9yOwW/rBL42Y99i9KXxESk1EVk2zTHMWrvuJuTIrtm2eZ/td/Iqifq+3aW
 sYz4WmeEE+J0ctg8UknL+falUUpfAKKMxSsi5+VuXH60rA9E7IKIdsUqA9Cphhdn+i786eRcB3d
 3qXR7uVE1TxhfraDahw==
X-Proofpoint-GUID: EwI0wHOX3e-4dulu00ojoTIwehWk1I95
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240056

The egpio function in the sm6115 driver is registered as a strict pin
function. With strict pinmux, a pin muxed to egpio cannot then be
requested as a GPIO.

Use MSM_GPIO_PIN_FUNCTION() to tell the pinctrl core that this pin can
be used as a GPIO.

Fixes: 0524a508b2cf ("pinctrl: qcom: sm6115: Add egpio support")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-sm6115.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sm6115.c b/drivers/pinctrl/qcom/pinctrl-sm6115.c
index 0099c474c44222c71ef281dcdeb25b7eeeb4deef..7aae2bb15a435a6f64e996a864c49371dc1fcef3 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm6115.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm6115.c
@@ -689,7 +689,7 @@ static const struct pinfunction sm6115_functions[] = {
 	MSM_PIN_FUNCTION(ddr_pxi1),
 	MSM_PIN_FUNCTION(ddr_pxi2),
 	MSM_PIN_FUNCTION(ddr_pxi3),
-	MSM_PIN_FUNCTION(egpio),
+	MSM_GPIO_PIN_FUNCTION(egpio),
 	MSM_PIN_FUNCTION(gcc_gp1),
 	MSM_PIN_FUNCTION(gcc_gp2),
 	MSM_PIN_FUNCTION(gcc_gp3),

-- 
2.47.3

