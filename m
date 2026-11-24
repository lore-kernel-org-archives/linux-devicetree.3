Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530593;
	b=HZ4P2x7F/8DQXV3tkXQTnCbPzz/4020FhYWSwZDRkfVj0YIRtkMYSA5cs9xtRRr/vMsq
	 4Z8r8Uuk5aVke76tBrNSdsmLxhGaJXioQlZsshy5A1SywVjTzJLnFf8VDdRygfYb4tw2i
	 DD3ZOuM1Rd1kamfeir7g/H2W+RrMnBS5Xw4v0Fe/rQpKt9rMgPujKQKLpS3h7selNe7Q8
	 gbNPpIYXzW4KFrLoRkVJTJn3SjzphlLPIMryZi/T7yNpowtKG0UYdivitEQY9V29s2scr
	 wH1YY8H4YW1IdDCZE2W6afb7KgYvlQQCDQ64BVPHWqrhcGD1toX5DtZw1T8+F7RTZuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530593;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=3qcRfIlF1T4ySoXZ+v83OgxNz/4TdexrEFW75Nz2ipM=;
	b=2eKIpJag+Qh5ZVP5OcmHW095kyHoqQPZkOGdP0NsNDm1Sc3NgqG9SAm9y1h5VVmdjgyu
	 3xUYaGXWFNBJZSZE1ACoPq1wPrHgSk66rRkppM5mAuBRsVj2e7+P8bsOEt/BkM3wXOPSc
	 pj8BtdOCbkVM9SKYW2MvAgFlVDrA7AxOfWJFg2idnH9wOTCCmslaBipDWIGG/Pfghgnd5
	 YdUThu/JjAi0km0FwC5fbtrmwyUJzfu6/GSk2wK7/mj0rLEYZtcz8c/qZt0zflY+Tb0h0
	 S3U4pgHAcyvzgZqca2kyMRaADEE3Pt2vs6Hp8ciwp65nMkqb5WV7ed3sH0d6n38jN9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L4KwiGVv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YsaGce0W;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFA0606A32A
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 14:29:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABFA0606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L4KwiGVv;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YsaGce0W
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAuhhk1291454
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 14:29:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3qcRfIlF1T4ySoXZ+v83OgxNz/4TdexrEFW75Nz2ipM=; b=L4KwiGVvKG+udgpK
	/GG3NYXP6f3/RzTL/dNmg9OmXXfFUQjdy0GEewMbi9su+d8cJtPO3KF8JnccYHob
	S2yuh3bK3fiSB7wBw+hZHajBdg810cryh/BNJGJ3ZifSuNwAEvPWSLuBrSFWZe2v
	uUNk8uqh1S/QxaviAGDnYFY/VkRIMCVyrAa8vug+2fu5gJkkCuCW5HHLIh6zeBoK
	VAchlmOYFrrLm5psAqpUX4aRhhdmc/m/IW8Gwc33/Vs3lmHhlm60BYMnm9xhjr0X
	vyjyxMY5ogrL3i/00Z3n9eYgaYr7DUfBryO7ja/G0af98BALcinTLI3f7fbJ6M7r
	ISZTkQ==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukrc8r9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 14:29:52 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-67c041acd09so6851546d50.3
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 06:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795530591; x=1796135391; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3qcRfIlF1T4ySoXZ+v83OgxNz/4TdexrEFW75Nz2ipM=;
        b=YsaGce0W8fuD02DqhYtGc8e3fkXVPP84b8NumHgRBySLChd5UI0GisBrI+UPfSgm5m
         sA3viRsD0HF7GvXYZkRRwmyJucrVDLOKuAPOQLI30xp1bGduCs6f420S9OEZ9zhHQH+y
         O7yv1sX96/iZTw3cj1jXi9fgOTPnodUznZErGBSOXan68QyMF01gMIwjQG0HFywaP589
         1WV233waX02WWOB+KNYuwm9Ir+jJZ3S08JT5i5MlpWWmMmN/2nf7gWZYA3fRs6NUqO2j
         eEeYGkKm0kYy6F6re3KeHhhorjzxzKdEeu27yhs4XI9jKI0MsUEoSI1zlJrCEyAi8Z32
         GCbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530591; x=1796135391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3qcRfIlF1T4ySoXZ+v83OgxNz/4TdexrEFW75Nz2ipM=;
        b=WeaVVpDhsF+DjxzPwxlxiDMIP56ytdmxkmXoSj4S+3vlIbF/cTU1i50l4y1lzbsKCl
         poGOAhkfELEmDfHl0TsBGkP/ji3557i7DcyKiKGd+G5kxmDRu6Es9fFYT7G1/+Z0/1df
         vH1mq93KPDYEsTz9hKFlBGBUSZ9us1s5DHSJ3pRdjmVUYMAzXTTcgluEvxMm1TuvcGOi
         rytM8ym7ZlEmujpI/wrt4k4atyZwWNDT3/2Uomtljt5a3u+nX49jkLduwLwyWlNFLMyZ
         fFZOS2I74WTJh2Vs7mWgGCygpOxhmw/utXbzhjmM9ItmlE6rL18hnXY+4wLB/pIGV/c+
         O7Mw==
X-Forwarded-Encrypted: i=1; AL+hErEVb2GC36vZ1rO4Ee+gOSWik0LkcMhsD1mxonGYX0j+i5+p1KTYmYIp4uOfLrrwc/VFnSJ5BYfWtwkV@vger.kernel.org
X-Gm-Message-State: APuU4Z+SaOsDW2y1P3yG95x/kS1sooB1EEyc4FNL8k/ZCpHxjY73y5p1
	5z+DSp/RAV9iSxDQbE5ri6JVS+2lhumgRe1R9HZ96uW3uDZAYPv1no566XOOJQVHNGOTDEytZ9P
	l1ls5ahhvYvIS56Ht3Va5D/ra3r2QYDUyVFt8syqyujt0ZEfw6wNB0wGKAU82hK38
X-Gm-Gg: AZFdTZcbg2tThixMJmL6oQIJwCs8yY3exCPNIJfc18zQjmrW5xInbWHtix7e5+xtV2F
	xJ3Yr3mKg4r4FBOD2Elm1MvhuNdS3m9iu2svkULYDi+HcX9HXmviHX4OfHYKAfFyYCBo2ZfKT+6
	6V2HZMfG+hCLyss2CFnAeSiv13570n3XyRNYQj1NS+lBA8ghpysKO76Y6z+5NHUItEXgBjVs4NV
	LE6LTJuOcR+5G634QBU3oeTTDHU2yT0RfOpS83Q3c0y14n+vSDhVaraQc5nWUKAbR54ONe1N0ij
	aepwnIRPpW1kF1zX6B/SUaIvrPq7MjfE9eLkJHUvIn/j2kB+EZ89CoJlWafPm0Gk5EU2sMblKsG
	H5PlMT6MDV6jWCJNtc1iOUbrztVsy0LWOTO1piWC2cbowR1yOlOssg3JomO10MZoMUWtZTwacZM
	jPB8f1cGC/R26PdBjCzEMGR6+XrV+PptiiFboUoRI/3BVJ9+WXuQOFL6gOV6B+67Q=
X-Received: by 2002:a05:690e:13c9:b0:67d:a221:7c5f with SMTP id 956f58d0204a3-67df443b58dmr5202489d50.79.1795530591031;
        Tue, 24 Nov 2026 06:29:51 -0800 (PST)
X-Received: by 2002:a05:690e:13c9:b0:67d:a221:7c5f with SMTP id 956f58d0204a3-67df443b58dmr5202468d50.79.1795530590339;
        Tue, 24 Nov 2026 06:29:50 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b34e9c3ffesm12013821f8f.19.2026.11.24.06.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:29:49 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 15:29:28 +0100
Subject: [PATCH 11/11] pinctrl: qcom: sm8550: add the egpio function
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
Message-Id: <20261124-qcom-pinctrl-egpio-v1-11-34f2c06b2658@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8150;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=J4DAn+qADLMf5o42u23CiQYOqKfsJjT9cKfd0SkL+L0=;
 b=owEBbAKT/ZANAwAKAQWdLsv/NoTDAcsmYgBrBZ9DPOCs+cvZuL91To183BhVxb3tuTjQX9Oa2
 tdWUSZkg/WJAjIEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawWfQwAKCRAFnS7L/zaE
 wwITD/Y0Nqf1J46ljnqOnLaqeCg5DklPqn+YjEysY+TfX8CI/0pPn30m4hSGCxO5AiY3gB+yE3p
 x5w1yZ0P0DQqDmFoAipEYrvTUyUcfxI5bIjqLHNRcTwV6CGfbQk+XGLHIpKofcNyE9ydTGn7sTC
 zkPhrz9aNSFaMhfgCfxwqsqxexvUGzTRuXgFdBQGRKbnytCEN6FIb+R0fvExYeg5kRVCQ9RuHnP
 OAfpK32C2rryvf8nWLHUtxdDO/7Zsg3mSPQpfA6KLE6KaIfjRaFJeF98qCklrPiuYIE29yr14Dq
 ftdOtoOGFeKjv5n1TvNjnsYnsbnqDIs4YVuSVMnssFErhxt4sf6c60+QJ36yCqgoa+QyY8Tx/iy
 cV7WXkmXE+054sSujFuAUdbwyzsbikxIK0oVHJIt84QOyeF3oPQ7x/dcK14EkUuta0al8DToKwp
 peXxQfgG/Vv91xOwSwwXtfWpcgA6R+eWclK2VeJTUhboo+Utwkc6wz4FWAPt56zvwHEIehwrI5k
 7b7rRxBp9lxG618hV8uBsgCg+aILsMPoJs5CoWvxn3XDy3Myp08/8wc/pMEXYoZCvsmSzlsIter
 Qm1maEHp0/3Fj0ndKWBz4OtNW3bRqvF5MBPG9tQhfHoqXQNmNv2cF8JLQT7kSuEyY2OT2bjFbeP
 YtxUoHRwLC62L
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfX9qGNC8Bhj538
 9eER2oSrHhPWFPMfnitfhlE8gwBhTFBqBTAqu7DbI0Pv7RT063HqtObYurBcjnZZyOZHfUWeB/j
 1EBst5W9pa+M1I/bYhN1T6yXOuFw2u4=
X-Proofpoint-ORIG-GUID: -n-v3N6S6-SNLDoiHVztOMGCytA3H08g
X-Authority-Analysis: v=2.4 cv=M+rYuCws c=1 sm=1 tr=0 ts=6b059f60 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=dhvzinyhbE48SZkY40kA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfX4wm00Fuy6pZv
 FUeDv8g5OdT2rGMJs2rq+8soLdBTqpt1z8wIzqx4Xcev02ItaQNkl1kCCqAqo7MQm47E0btR4Nj
 rPq/nuSvJsnUhjUsEnU3j1IyYcle+B+Uz4oeyFqExrLYGcv7jPK82FxFFDXh0ixI45QwTiqBjzb
 TDMY0Wa+B4QIMAlHqqpTjJEoBqBurXOlyIn+u7OiDhoTL4pLpLxcwrQk9XjpnvfteKwrLU8/xIM
 b897xUidAlF9PYIXqks13pjLyXcGRy9r4+baiDBcdeXhDUnbRCeBPbYMmjXfjjY8emeypArL1Gz
 0Q0MaGVCX/uzSvKa212dAkSME4dH55EgeFiiLmgJ5BJYxk7FCnv/d/3GMD1rnHDjeqzfjmdFiGC
 NAV5WaY1EByg6X7mxz85OUg/UJ941HgGySHnNXH1au80jJyEL/EBCbUwDr+LfVrjPCYmDKVp8na
 dnVKzCWES0TL7DDXAPA==
X-Proofpoint-GUID: -n-v3N6S6-SNLDoiHVztOMGCytA3H08g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240056

The sm8550 driver sets .egpio_func but never defines the egpio function.
Once muxed by the APSS TLMM, an egpio-capable pin can never be handed
back to the LPASS or SSC island.

Add the egpio function for GPIO 120 and GPIOs 165-209.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-sm8550.c | 105 +++++++++++++++++++---------------
 1 file changed, 59 insertions(+), 46 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sm8550.c b/drivers/pinctrl/qcom/pinctrl-sm8550.c
index d12256d970a0c23142e3e633a1eae001e3a18958..b73ad324f883debc029417f15c783d4fe7b9aa93 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8550.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8550.c
@@ -568,6 +568,7 @@ enum sm8550_functions {
 	msm_mux_ddr_pxi2,
 	msm_mux_ddr_pxi3,
 	msm_mux_dp_hot,
+	msm_mux_egpio,
 	msm_mux_gcc_gp1,
 	msm_mux_gcc_gp2,
 	msm_mux_gcc_gp3,
@@ -844,6 +845,17 @@ static const char *const dp_hot_groups[] = {
 	"gpio47",
 };
 
+static const char *const egpio_groups[] = {
+	"gpio120", "gpio165", "gpio166", "gpio167", "gpio168", "gpio169",
+	"gpio170", "gpio171", "gpio172", "gpio173", "gpio174", "gpio175",
+	"gpio176", "gpio177", "gpio178", "gpio179", "gpio180", "gpio181",
+	"gpio182", "gpio183", "gpio184", "gpio185", "gpio186", "gpio187",
+	"gpio188", "gpio189", "gpio190", "gpio191", "gpio192", "gpio193",
+	"gpio194", "gpio195", "gpio196", "gpio197", "gpio198", "gpio199",
+	"gpio200", "gpio201", "gpio202", "gpio203", "gpio204", "gpio205",
+	"gpio206", "gpio207", "gpio208", "gpio209",
+};
+
 static const char *const gcc_gp1_groups[] = {
 	"gpio86",
 	"gpio134",
@@ -1367,6 +1379,7 @@ static const struct pinfunction sm8550_functions[] = {
 	MSM_PIN_FUNCTION(ddr_pxi2),
 	MSM_PIN_FUNCTION(ddr_pxi3),
 	MSM_PIN_FUNCTION(dp_hot),
+	MSM_GPIO_PIN_FUNCTION(egpio),
 	MSM_PIN_FUNCTION(gcc_gp1),
 	MSM_PIN_FUNCTION(gcc_gp2),
 	MSM_PIN_FUNCTION(gcc_gp3),
@@ -1612,7 +1625,7 @@ static const struct msm_pingroup sm8550_groups[] = {
 	[117] = PINGROUP(117, cci_timer, phase_flag, _, qdss_gpio, _, _, _, _, _),
 	[118] = PINGROUP(118, qup2_se4, cci_timer, _, _, _, _, _, _, _),
 	[119] = PINGROUP(119, qup2_se4, cci_timer, phase_flag, _, _, _, _, _, _),
-	[120] = PINGROUP(120, cci_timer, phase_flag, _, qdss_gpio, _, _, _, _, _),
+	[120] = PINGROUP(120, cci_timer, phase_flag, _, qdss_gpio, _, _, _, _, egpio),
 	[121] = PINGROUP(121, i2s1_sck, _, _, _, _, _, _, _, _),
 	[122] = PINGROUP(122, i2s1_data0, cmu_rng, _, _, _, _, _, _, _),
 	[123] = PINGROUP(123, i2s1_ws, _, _, _, _, _, _, _, _),
@@ -1657,51 +1670,51 @@ static const struct msm_pingroup sm8550_groups[] = {
 	[162] = PINGROUP(162, qlink2_request, qdss_cti, _, _, _, _, _, _, _),
 	[163] = PINGROUP(163, qlink2_enable, _, _, _, _, _, _, _, _),
 	[164] = PINGROUP(164, qlink2_wmss, _, _, _, _, _, _, _, _),
-	[165] = PINGROUP(165, _, _, _, _, _, _, _, _, _),
-	[166] = PINGROUP(166, _, _, _, _, _, _, _, _, _),
-	[167] = PINGROUP(167, _, _, _, _, _, _, _, _, _),
-	[168] = PINGROUP(168, _, _, _, _, _, _, _, _, _),
-	[169] = PINGROUP(169, _, _, _, _, _, _, _, _, _),
-	[170] = PINGROUP(170, _, _, _, _, _, _, _, _, _),
-	[171] = PINGROUP(171, _, _, _, _, _, _, _, _, _),
-	[172] = PINGROUP(172, _, _, _, _, _, _, _, _, _),
-	[173] = PINGROUP(173, _, _, _, _, _, _, _, _, _),
-	[174] = PINGROUP(174, _, _, _, _, _, _, _, _, _),
-	[175] = PINGROUP(175, _, _, _, _, _, _, _, _, _),
-	[176] = PINGROUP(176, _, _, _, _, _, _, _, _, _),
-	[177] = PINGROUP(177, _, _, _, _, _, _, _, _, _),
-	[178] = PINGROUP(178, _, _, _, _, _, _, _, _, _),
-	[179] = PINGROUP(179, _, _, _, _, _, _, _, _, _),
-	[180] = PINGROUP(180, _, _, _, _, _, _, _, _, _),
-	[181] = PINGROUP(181, prng_rosc3, _, _, _, _, _, _, _, _),
-	[182] = PINGROUP(182, prng_rosc2, _, _, _, _, _, _, _, _),
-	[183] = PINGROUP(183, prng_rosc1, _, _, _, _, _, _, _, _),
-	[184] = PINGROUP(184, _, _, _, _, _, _, _, _, _),
-	[185] = PINGROUP(185, _, _, _, _, _, _, _, _, _),
-	[186] = PINGROUP(186, prng_rosc0, _, _, _, _, _, _, _, _),
-	[187] = PINGROUP(187, cri_trng, _, _, _, _, _, _, _, _),
-	[188] = PINGROUP(188, _, _, _, _, _, _, _, _, _),
-	[189] = PINGROUP(189, _, _, _, _, _, _, _, _, _),
-	[190] = PINGROUP(190, _, _, _, _, _, _, _, _, _),
-	[191] = PINGROUP(191, _, _, _, _, _, _, _, _, _),
-	[192] = PINGROUP(192, _, _, _, _, _, _, _, _, _),
-	[193] = PINGROUP(193, _, _, _, _, _, _, _, _, _),
-	[194] = PINGROUP(194, _, _, _, _, _, _, _, _, _),
-	[195] = PINGROUP(195, _, _, _, _, _, _, _, _, _),
-	[196] = PINGROUP(196, _, _, _, _, _, _, _, _, _),
-	[197] = PINGROUP(197, _, _, _, _, _, _, _, _, _),
-	[198] = PINGROUP(198, _, _, _, _, _, _, _, _, _),
-	[199] = PINGROUP(199, _, _, _, _, _, _, _, _, _),
-	[200] = PINGROUP(200, _, _, _, _, _, _, _, _, _),
-	[201] = PINGROUP(201, _, _, _, _, _, _, _, _, _),
-	[202] = PINGROUP(202, _, _, _, _, _, _, _, _, _),
-	[203] = PINGROUP(203, _, _, _, _, _, _, _, _, _),
-	[204] = PINGROUP(204, _, _, _, _, _, _, _, _, _),
-	[205] = PINGROUP(205, _, _, _, _, _, _, _, _, _),
-	[206] = PINGROUP(206, i2chub0_se8, _, _, _, _, _, _, _, _),
-	[207] = PINGROUP(207, i2chub0_se8, _, _, _, _, _, _, _, _),
-	[208] = PINGROUP(208, aon_cci, _, _, _, _, _, _, _, _),
-	[209] = PINGROUP(209, aon_cci, _, _, _, _, _, _, _, _),
+	[165] = PINGROUP(165, _, _, _, _, _, _, _, _, egpio),
+	[166] = PINGROUP(166, _, _, _, _, _, _, _, _, egpio),
+	[167] = PINGROUP(167, _, _, _, _, _, _, _, _, egpio),
+	[168] = PINGROUP(168, _, _, _, _, _, _, _, _, egpio),
+	[169] = PINGROUP(169, _, _, _, _, _, _, _, _, egpio),
+	[170] = PINGROUP(170, _, _, _, _, _, _, _, _, egpio),
+	[171] = PINGROUP(171, _, _, _, _, _, _, _, _, egpio),
+	[172] = PINGROUP(172, _, _, _, _, _, _, _, _, egpio),
+	[173] = PINGROUP(173, _, _, _, _, _, _, _, _, egpio),
+	[174] = PINGROUP(174, _, _, _, _, _, _, _, _, egpio),
+	[175] = PINGROUP(175, _, _, _, _, _, _, _, _, egpio),
+	[176] = PINGROUP(176, _, _, _, _, _, _, _, _, egpio),
+	[177] = PINGROUP(177, _, _, _, _, _, _, _, _, egpio),
+	[178] = PINGROUP(178, _, _, _, _, _, _, _, _, egpio),
+	[179] = PINGROUP(179, _, _, _, _, _, _, _, _, egpio),
+	[180] = PINGROUP(180, _, _, _, _, _, _, _, _, egpio),
+	[181] = PINGROUP(181, prng_rosc3, _, _, _, _, _, _, _, egpio),
+	[182] = PINGROUP(182, prng_rosc2, _, _, _, _, _, _, _, egpio),
+	[183] = PINGROUP(183, prng_rosc1, _, _, _, _, _, _, _, egpio),
+	[184] = PINGROUP(184, _, _, _, _, _, _, _, _, egpio),
+	[185] = PINGROUP(185, _, _, _, _, _, _, _, _, egpio),
+	[186] = PINGROUP(186, prng_rosc0, _, _, _, _, _, _, _, egpio),
+	[187] = PINGROUP(187, cri_trng, _, _, _, _, _, _, _, egpio),
+	[188] = PINGROUP(188, _, _, _, _, _, _, _, _, egpio),
+	[189] = PINGROUP(189, _, _, _, _, _, _, _, _, egpio),
+	[190] = PINGROUP(190, _, _, _, _, _, _, _, _, egpio),
+	[191] = PINGROUP(191, _, _, _, _, _, _, _, _, egpio),
+	[192] = PINGROUP(192, _, _, _, _, _, _, _, _, egpio),
+	[193] = PINGROUP(193, _, _, _, _, _, _, _, _, egpio),
+	[194] = PINGROUP(194, _, _, _, _, _, _, _, _, egpio),
+	[195] = PINGROUP(195, _, _, _, _, _, _, _, _, egpio),
+	[196] = PINGROUP(196, _, _, _, _, _, _, _, _, egpio),
+	[197] = PINGROUP(197, _, _, _, _, _, _, _, _, egpio),
+	[198] = PINGROUP(198, _, _, _, _, _, _, _, _, egpio),
+	[199] = PINGROUP(199, _, _, _, _, _, _, _, _, egpio),
+	[200] = PINGROUP(200, _, _, _, _, _, _, _, _, egpio),
+	[201] = PINGROUP(201, _, _, _, _, _, _, _, _, egpio),
+	[202] = PINGROUP(202, _, _, _, _, _, _, _, _, egpio),
+	[203] = PINGROUP(203, _, _, _, _, _, _, _, _, egpio),
+	[204] = PINGROUP(204, _, _, _, _, _, _, _, _, egpio),
+	[205] = PINGROUP(205, _, _, _, _, _, _, _, _, egpio),
+	[206] = PINGROUP(206, i2chub0_se8, _, _, _, _, _, _, _, egpio),
+	[207] = PINGROUP(207, i2chub0_se8, _, _, _, _, _, _, _, egpio),
+	[208] = PINGROUP(208, aon_cci, _, _, _, _, _, _, _, egpio),
+	[209] = PINGROUP(209, aon_cci, _, _, _, _, _, _, _, egpio),
 	[210] = UFS_RESET(ufs_reset, 0xde000),
 	[211] = SDC_QDSD_PINGROUP(sdc2_clk, 0xd6000, 14, 6),
 	[212] = SDC_QDSD_PINGROUP(sdc2_cmd, 0xd6000, 11, 3),

-- 
2.47.3

