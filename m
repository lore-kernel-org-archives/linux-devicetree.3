Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795688488;
	b=Kz2vToLs+EitIK0pfbfr55yCdpXTvLrLgVPm4uFOZ5ap66QRxeAinIZgUbBS0PByf3hK
	 4A01cb7Q9A0hy4NNIgsQx6y7jA5Cw/UzdEbppFnQuIuD+v2jZaypw0gNQ1aEnw5HwYG5G
	 R3DHyvm7qA7VsLK50FuuBJwT44ZL1ZU7Lhp9wbzlG55vVCdBE3baW1cNHkEYGbtIj14Fr
	 7mu8XYlbmStRQBBzUkG0AACbNxK/fnuvo4RIYd8Zvl5Gzu42JdXgdrqnG7T9tVdbmRTWv
	 D3q0iv0iFfMy15UGrNyW9+C4Bd6mQ+fikdzb1ba2UXuGPfydswk+aka/gvfUqDt8MMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688488;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=gSMmE/tgHywg+Ku8MuFxxbFDolusK8It1lOLAQ9JkzQ=;
	b=5ZlpIJJIsDjLKkCMAiKP++zQnbIlPH6UO+2UqkSviJ0IMj0BjGik7PSdbyX7RZzKUIC8
	 96wukozFqhRLdFkYYi4PGLXzsAxwt4/xFBjWWh0NC0/ElJ2ddFhetLml8Q1xO1tYbGAIZ
	 NlV5ixsWmZsJkQguOUGqH/qLYe3dG9TRFFvqLj9m1ldyiJEyGMqGlHmtBxbUxEK9RrqY7
	 V+91/3MI6Wx2LtoGQ3ECaQcuKdr1ENtkVdVNCqqiBgb0mHJ6NwTGbbPgTtXbxd+TdRNU3
	 ol1PIb/A3AlZa508jPazfFU7vmNKGdnEW8lDNgAuFFs65yL07/GZG0rjy13XCMupG/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YQNAa3KV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Iukfzc2x;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB475606A321
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:21:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB475606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YQNAa3KV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Iukfzc2x
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ8okvQ3537804
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:21:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gSMmE/tgHywg+Ku8MuFxxbFDolusK8It1lOLAQ9JkzQ=; b=YQNAa3KVzrUGRphy
	yHAh/HSryBqZZt4Naj0EX0LISornqJaCvbya2KYWOO6CkHdZGdSkgaQHb+VqVdy2
	DHM77nt/uurT9cw+a3FTeqxC2LPT0w4CEBMVkDkvFR6pgGDI4CImRayaxnMCzcf0
	SjvaZs2j+Mx//+ukhQfMpJPhIFL6N7C3N+Ff17JIrFuDkdb3OopW/Lgnf4EinRYM
	ht9BDhDSJh8ALWiMwXAmw9N5isueDffVq3EDGEW5jBDTD3GWNmiCdXM4GJPQ0xgs
	lFubo36SZTaPZJYw58B8C/7gOsM9NGkYdutHpJC8nfHihqlgdvwYbAMt/lFvNFhD
	kDgWVA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6hm80c2k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:21:26 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-92126ecb4b8so113030186d6.3
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 02:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795688486; x=1796293286; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gSMmE/tgHywg+Ku8MuFxxbFDolusK8It1lOLAQ9JkzQ=;
        b=Iukfzc2xMswq8CWtY/PARIDkGUncaVsw8lCWr5buylh+4NjoOGvmYsdvEM6EFf9Klr
         5MyHbUZHAh/ZsZhWOJLGB+hcR/bM+X5UH+jT17LtqKLTnXX6gNTkJ3OcJ4saSDUXFb/N
         rLYR9mlaJ90Yxy60F8jxVfCHHJha0t+Cg6dWq64w79StB+7Lrcz3uFbOZJay/5DX41N4
         u5FrNIPUfiZLHT3PJYd0mdCQKRFMnoMknk8swVL8oc/nELU9V4zkTrgdxlaHuezJNnQQ
         T9Mx1d3JTx3Wrn7fdK5hLVDz6QPe/BCZPVvUyBjp5rGB75R+cmn6g7qZhmJnsRPvWCB2
         uRtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795688486; x=1796293286;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gSMmE/tgHywg+Ku8MuFxxbFDolusK8It1lOLAQ9JkzQ=;
        b=CxyAPtU+HyzlP8atd8QW4mITA8OknFvHWXsyMBPohOsiaibO+4FiKy8MtfyF9SDQ6c
         amT7EycEVysVnZT/bufWrzpCaGQsYh3NEdqDIGE4/QgfUbP1ywsjimUkr8tP2L3TSIxI
         f6zT/CYsVRjp8swBRVgJaRewq/GnTBMI5/+WPbfZKwyPQclFQI1Zm3Gmnwmdhjpb+nSa
         wfb8SvtD+JBMjKqCmCHj6NYIbOwAPaIUC62fD2SsojTMwx74xzqXkD45M0T+0RdezpTD
         43CaDgaHAmU0BYo1CcmKtFiOcg8JFo5mVnLC5qKa5uztVIHzvSLWE36Ro0h3GdHz4Uqe
         q02Q==
X-Forwarded-Encrypted: i=1; AL+hErE9jlpYpXLVseBX1hQCglN9cDcBwAdW5WgIzokR5yMxTbMxE+PZKMerQ0mQwnoksb0yPp3f5Q24DpvB@vger.kernel.org
X-Gm-Message-State: APuU4Z+byGKd4sjCKCqOvUu+dQSeNVbBajmUu5ctYN507b6eD3QV0zFB
	BtCAdqoBihKlCRV9Sf6Lnt/3YXPOZf+Ui/6QOTFO7Wdx9XOf6Nesbh0GFg7T9Aoz+JYlJTHLOKC
	pUmGk4uiH29SyjN7ADCwq11v52cFdAphol9oJCW+WlNJACOE+Yw/fPB6yQceaLU0XfqT35Ilh
X-Gm-Gg: AZFdTZd7/xEueJKev6x/B6Tvbbd8VMFkMtXP6g4LNtAZXwafVAeFQhLo6ySeQKWwe0r
	t8K7sCOrHrkHbrfAWvXDixqvzobK+4k4mdp4K2VWXS8/CbGgMRuYXPP9d8JwPMESJqeh6ii/B7H
	Kj2/C9diIsCwq+iCcTRG1M37IXnjzlOQ3VqK0V/DGpI986YKviY3ffigHuekWKglvdIP3leM4X+
	eTXuqJFMweW1YhuD/a+Aps8j43NtpqMH4MJaEraTmPlegpXPOO7aliPVKLyyZU0mxHFBKSeAwvp
	0CZW625eANw0y68R+wOzX+BFmuNqBoYfb4T/S6PGO/Dhi8d3/xhPmI0lvdx6ZOis0tlU/nOJBl7
	HUwoZP45DDqYbrtfSjp0IfD5FHnZ/x+iaPlQoG/KpVmnRvA2FLcEZmAagetHd6FZEynziBjSO51
	p2BN3tFjfZ9EvDjUUxmK7xyjLhtZ9R64JJYThT4FxUXwdTWEN/PFLTz0kwk96SM54=
X-Received: by 2002:a05:620a:2949:b0:949:6e15:e1d4 with SMTP id af79cd13be357-949ba9fbe56mr3585124685a.56.1795688485678;
        Thu, 26 Nov 2026 02:21:25 -0800 (PST)
X-Received: by 2002:a05:620a:2949:b0:949:6e15:e1d4 with SMTP id af79cd13be357-949ba9fbe56mr3585122385a.56.1795688485284;
        Thu, 26 Nov 2026 02:21:25 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9687sm658817885e9.10.2026.11.26.02.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:21:24 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:21:10 +0100
Subject: [PATCH v2 06/11] pinctrl: qcom: kaanapali: mark egpio as a GPIO
 pin function
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
Message-Id: <20261126-qcom-pinctrl-egpio-v2-6-521fb057d3bd@oss.qualcomm.com>
References: <20261126-qcom-pinctrl-egpio-v2-0-521fb057d3bd@oss.qualcomm.com>
In-Reply-To: <20261126-qcom-pinctrl-egpio-v2-0-521fb057d3bd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1213;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=NxZjSICPl9X/NbtdwNSDoCfWXakeOJNPiqBVm6AQlSE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrCAgT/O1M9gwwpG4og3v18LGeCALWLbDFzqiO+
 dLC78I/wuWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawgIEwAKCRAFnS7L/zaE
 w6S0EACwJ6oFlDzdg2+Ukbx/H0iFJtaVtQuHK6TERMpOzXCHo68afBjKEY5CHTi5F8Yh0mz1qyr
 6/MI/KklQBfeIIEY15+bZOge0Dp0kGeCX79ayWBqPeaoIC0qk4JkuZK2Mz0+dMK03BKnVqeSN+6
 Dok+11wF7f4QiVmehB7jpzRpKgyq7/7bOtwWKW9r690odx8wycEZcoUALAgJNaxSMlac1GkhZwG
 K96Fm1kLDvjmsH7205dLU3gLRpK5q5JjpJp0fZm79UiU4jug6cLCI7b2G29muSpx5UWnScZ5olj
 pccieYYC3rkEglNWyEepqYUaZZUkRNIhzvv1GhlaqBiWO7JNj7vT/62Rbb56cE4vOrfsPojFNa9
 9Ke2mMA2Fkkmv0tvWZ4HG6I3/tvH78sm9f8adha9PZyJSvabr59Akfpu6pozUtElm3tOQlyZ/7a
 5oxOOPmDF833LQOruRGMp662FFqMwG2v0g59Je4StwU+njWtCqAqKlhZJEs1ejwbEuCyyHvDcxO
 S42rQ32iAOGvAG5n/9Mr41K8lOOQa8xCA+wNeLUr6P6KS3ZG76ciZIlJSyvToUcaGpEdMG+6o1f
 7MNTzBdPKFYm+6+VVDsbZndePSzBdUzJStQ8uPV4ntuF0GjFec702PtpqXgMzPtcpJbiQcAqSfH
 WHtg9ZQDo/UMDZA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: TKrysOZSYPoCBhkgcnkE2PQMazPM17IQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfX4qAreP4hY/Uz
 r9vTR5TWwry2UhMN3HTIRksUWKmpQ7Y1gF0mXwsKtNzN4PMZ7CLSn5iV49N2ND+6V6H1+evdlV6
 LvZV5efFcBZZEKZrUg2Ouf7cTnQOZ/M=
X-Proofpoint-GUID: TKrysOZSYPoCBhkgcnkE2PQMazPM17IQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfX6Kbpj0TRNg3r
 2cd2GkGsrO2l0PYwsS7zUcZjp5n7IUav/qvnfhbToQULbOgh2q3pkKh0kduSBFxcOWU2o7owj0M
 2PMnjw3gI1euRAIrLpNb6TN1uY1+T2BXZssOSmVduKYr3qIAMqsdK+iaOPZxQv7kwQ1mrBKBmP8
 No218tx49ShL+vER5Y8Pvh42curSN+Gx82Gmb5ioam57DnveBovRq0QhA9b2XjI9m9qVP+B37ne
 XoEXnupIs5sxTbAENDPkXPV5NIBk2lw8CBjyR4A/BDnXxRyO1V65YkHCuUtvDy08xE2W98yDg7l
 EiTkR7aoyi205F5kOedI0pd7Q/7oMsNOjXlykPjmRxUi7h5skhDf4jUxY1jYGHe+VgCPmJppofL
 Ynw4gvCrEzbLp1/uxC1/Q0c5vQoc86PZMdVm+NzCqZn5fqcxOiRu/WMFxWDoCDC2A72nDIGz9P7
 N+jogBzbWRryCN4E15Q==
X-Authority-Analysis: v=2.4 cv=O/usLx9W c=1 sm=1 tr=0 ts=6b080826 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=eqPcoR3FCcofXUvmvEIA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260040

The egpio function in the kaanapali driver is registered as a strict pin
function. With strict pinmux, a pin muxed to egpio cannot then be
requested as a GPIO.

Use MSM_GPIO_PIN_FUNCTION() to tell the pinctrl core that this pin can
be used as a GPIO.

Fixes: 35ff9c6b318a ("pinctrl: qcom: add the tlmm driver for Kaanapali platforms")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-kaanapali.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-kaanapali.c b/drivers/pinctrl/qcom/pinctrl-kaanapali.c
index 2c27eb2255c30777310e6280f6767b426b12fc79..04e47b475ee60fd4990b2b54774f566360ce643d 100644
--- a/drivers/pinctrl/qcom/pinctrl-kaanapali.c
+++ b/drivers/pinctrl/qcom/pinctrl-kaanapali.c
@@ -1379,7 +1379,7 @@ static const struct pinfunction kaanapali_functions[] = {
 	MSM_PIN_FUNCTION(ddr_pxi2),
 	MSM_PIN_FUNCTION(ddr_pxi3),
 	MSM_PIN_FUNCTION(dp_hot),
-	MSM_PIN_FUNCTION(egpio),
+	MSM_GPIO_PIN_FUNCTION(egpio),
 	MSM_PIN_FUNCTION(gcc_gp1),
 	MSM_PIN_FUNCTION(gcc_gp2),
 	MSM_PIN_FUNCTION(gcc_gp3),

-- 
2.47.3

