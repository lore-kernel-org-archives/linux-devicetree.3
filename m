Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794310218;
	b=0LBLoLC/adueBHTLb2teJKH584z9QIjHCnJDyycJYF6UKSPKn4fHpRbnfUuFp1Ywttw7
	 8WyCuSlz/XpUSPvNDLbElpAKYd67QHLoJhofWlCLx2xBb7/PKQXCoAdlbHI2dTUkf4Zke
	 BOxyCya3SITvbeq/92yPggaJoEac4LEsk8T5Z0/2kZ6AB/mow268HhNUJ74XuNngVtSQb
	 E6zmeMux5o0YZvwwaasCXmlYwwAfBUBAp7CQZh2VhXzxNWqBf6DWt9/B54PjNENrID/0C
	 Du2coct7yVsxCZJRClpSu+0JZ4y9/K4uYUzgwJOfNAMAwX2nUSYTKfP7OSfdlPpLtNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794310218;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=swew1lvK9VYq5HiOqRj+C1680e310sD/zdYMSu5J8YY=;
	b=UYgbxBy9O6Kjr/fmU56k18bd8g+VAn/7DCgeF7b2lR3194t3TOwjBTOM1QrvdEurn0oi
	 kdsbzNJgqhot99P9ogmGS/jnbI6bbXwLEl9A7WJXT42adLM4teRrRpQopT8Pbkyr29PPu
	 TOheyn3CSJXVnUbI5F4Hs0E5swLQU9GPMDJCsJGzqmrKFfdTOFBDJVbo3+VEPLkvYrgGZ
	 fMPH/JLTzHh/ktDY11BBBio727EpUdwW3P/0oHLKdHeX5VVhcqhonQ0NqHSQsWE4il8Ae
	 AKzT78FN8Yq+J4fKFvvwtR09VH4vpQNgIRDjaZHKzftyHhebonc/bL/fVCMboqivRQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QqnelBNb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d7bbIAyB;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37802606A334
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 11:30:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37802606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QqnelBNb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d7bbIAyB
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABAFCT3178179
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 11:30:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	swew1lvK9VYq5HiOqRj+C1680e310sD/zdYMSu5J8YY=; b=QqnelBNbbS62un9n
	7ny8IsyVSWcBmz6Xf0VREBrSrSnCpvech2cV9YL94kXrOxcASwIRy+h0AgfiAoJD
	wyRFSAVn7H63KnF7UbKqKoCJakBJpBuVgVNRvm+Ay4CSdZ/YSMdhSSZn6m8L9DYU
	WcO21F0zTvhilgLPVXqBsbOXt+Cen0SaKaPoPHLE6PjzNMk0kpkiiZcn95esr67N
	6GJVmIJaeo2anyJbus5ugKMVf8tIKBny/CgmR0ge5/y6N27TvXOF6QvgDW+OxxWV
	lHEQwLnrYQHFb8uZcvaevnC388/FCcsTQqssJMV+7tCTgjLAUF00r8jkfeS0mFBb
	QV///w==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyufrm60-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 11:30:17 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-999ef3a68adso313425241.3
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 03:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794310216; x=1794915016; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=swew1lvK9VYq5HiOqRj+C1680e310sD/zdYMSu5J8YY=;
        b=d7bbIAyBjzOP+rGQyYdVsvz77IsNcsBnY1qiHF+tzWAmwGFefTYjwMw5vi4ceJ3QkF
         FH28xG9p6fWLIKst5KoqpICy+jGPU+awpeo1lt0GCWFiL4fw6L4uvvcASNG9pcrNwV7H
         IQ5gsf8ZeQvW53tUx7y/PYEALMF0TMvR0hiUnPh9Ro3Nw+aV21iSW66zcGNO/P+5m99f
         ceCOul2CXKjwj5N6saKKpbmeE228BcFmO3ycrfwQVpm6ax5uWWfrjJpEPLY5AsqNii40
         qe189CT+sPE+WJHlBjkxcRxmG8BcyOsjyJCF/BbOzeeiBLLIoTl/+oj0KemTVy+vcfSK
         uVPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794310216; x=1794915016;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=swew1lvK9VYq5HiOqRj+C1680e310sD/zdYMSu5J8YY=;
        b=H8dCUS4N898MK6ureZLVqwveyBOO4DrD8sK1l0UOO481jeb8i3pvRTbsAq2LPES/9t
         FEae1Bd1otagyBJ1dnxkKZtRr5+N3QTJjLKi/5NjzlugoZOqx0a1qAeLNLCFt5iqLd0n
         KpAupfyWX3h8lyrY2TPWgjIVbXLd7NHyQmibxCHBL7WTq/9fv3eGlk9GJ3U/DgnKmzjE
         t7VfiWhEIfw0xR7UJ3GqT1O9KHngD1NkUQGFe+WWvb/9faCpfdid7iJwoN2Yso3ivBsO
         epgnrHR7KUTUWoWy6GMqErmSBQ/gpriqNIRnF0JuHU9/3/QMg9B1XhJBZ2gJuZAZ3rdm
         VDFg==
X-Forwarded-Encrypted: i=1; AL+hErGzozWHRaVD0LfIufga6JKZHEKJCd8i5UpkRD7p03eYagKszhBHc3kRgv/GkVDiPF0GOUZClxg5CGUd@vger.kernel.org
X-Gm-Message-State: APuU4Z/I40LAAPnc+kr1m+7nkEW4xe8ON84/DR6HL8/CRwlFq1LYFNRt
	r2Q98gX37wuBS7L/0ZjFgk/j7P9BWePQTdZdVlBwUymmwCwlZBBpZ2I610Ts1x1RSnPMCzRTHu+
	EYihmKrMlfCUtCC0bTcYDmgNJkujF0WcEt+oERFEon9tMw9kT89F2zHGhkgmjZDqjg0R4L2cO
X-Gm-Gg: AYBFou1Ld2OULPEs83Ghs6z00WJ0GHZ4DBfz36zA0HqJpLEqY9u3bnhiu+MO8nSQJdB
	udD16YKbUa3rWGGGopPF/hYio2c0DdF+gOy2Kt00EJ9AuR4X7N0k4b0lTbjjg/q1T1TBvKM0s3Y
	UZTqkfKclK51NziJTGumqOUfsIUZPspr2i6apcLN9gBVfhH8E57sDRswiT0s5kzobb0kuIVm1Ps
	KAC19ZeMk9mcvyvrxiLp09aQ0zetR99OWSMuGJCQ0kgKPiIS2nik/HTMY0hfHtCamTtLkFb5bxS
	EnGsB5kEqRoDCo/xn4MeaiDHx+3oYN7+eiySzWnYkRaJrRaZ3UTsU+LTllWiOqls4rE+wacLJ7F
	aWNCzBhCnDbq8uyMuX+za4GgJXxYdnfaizc1X887paEmQQ7YsVyKvTzBUSp/XDPSi/AsJ4O5i53
	rWthiUFR37fX06oh3dDXSMTF+7Ml6fY4vmgP7i9vrjReQMcM6UcZsPVU0YqeNyWA==
X-Received: by 2002:a05:6102:a4e:b0:7cc:9d82:ae17 with SMTP id ada2fe7eead31-7d301b84485mr613060137.11.1794310216395;
        Tue, 10 Nov 2026 03:30:16 -0800 (PST)
X-Received: by 2002:a05:6102:a4e:b0:7cc:9d82:ae17 with SMTP id ada2fe7eead31-7d301b84485mr613056137.11.1794310215878;
        Tue, 10 Nov 2026 03:30:15 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01ff3428sm68744635e9.15.2026.11.10.03.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 03:30:14 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stefan Agner <stefan@agner.ch>,
        Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        Peng Fan <peng.fan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: (subset) [PATCH v3 00/11] gpio: vf610: fix clocks and misc cleanup
Date: Tue, 10 Nov 2026 12:30:12 +0100
Message-ID: <179431014821.61906.16254753709778386743.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105-gpio-vf610-fixes-v3-0-504e19de5ad5@nxp.com>
References: <20261105-gpio-vf610-fixes-v3-0-504e19de5ad5@nxp.com>
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
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: SqramfTtkF9B8uNu3euqGxFOG0l-dQ7F
X-Authority-Analysis: v=2.4 cv=S6lMU4sP c=1 sm=1 tr=0 ts=6af30049 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=WvVV-90v2Qb5btd7p0QA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: SqramfTtkF9B8uNu3euqGxFOG0l-dQ7F
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA0NSBTYWx0ZWRfXxZozHx7B77uf
 NUMtWAou52EXYsd13Dwz3aUbjcXy1WWEzvXHV1OBWLoFuSwqHk/4Mfet7HWOUUpxhzJDQyBziIu
 914BEBk1koUifNTAb4Lp+AYmaOvPJWo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA0NSBTYWx0ZWRfXx0ycTLRPr1Ig
 10DVovRxX2BGqjkBKQCR8ceSnSbHMEMRDha92RYkoM+Hx3vtPMHXLLXV7C/Iq8+L3zyFSSItyjT
 k49ZoJ+7vFMlGhfjUTpOhdnf2ACyDgqNqgLn2OL6CcAa2AVuDuN0x/csqvLTWiV7sRxPZWaHLn2
 BpLEZwcdXuopkQvqCbnOMxyjqAkggn+C6Q9ufkxAXeUs+uBZOFBn3fC3op0iTbdTb+iPRHDVw3t
 vRcLag/w+U/pQ5dilSh5bu9u299TlpkYaYvaPwOlFOj09waMqdm5R1fP31bYxJjPzDc714iqzmr
 qBOHWYsMxEXbtao0f0eDWygMSNfuvYuW5fTI8QGeDmrBmwzTsJPF9BQnCfVseEfytXTvDshpLYm
 2L8a7qpG9WqX8bjBWsAlysfrcJTGaeCEL0uOFloWNMtwWWHC6xI7FK90mJyugeUUOSTUBhkR4mi
 BUkgp0F1h08D6TURtmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100045


On Thu, 05 Nov 2026 11:52:58 +0800, Peng Fan (OSS) wrote:
> Per i.MX8ULP/93/95 and etc reference mannual, there is only one
> clock for a GPIO controller, so drop the 2nd 'port' clock.
> And for i.MX8ULP, the 'port' clock is for digital filter for iomuxc
> PAD, not for gpio controller. If we need to support digital filter,
> we need to add the support in pinctrl driver.
> 
> With binding fixed, to avoid dt-schema failure, correct gpio node for
> i.MX8ULP/93/95/94/952.
> 
> [...]

Applied, thanks!

[01/11] dt-bindings: gpio: vf610: fix clock requirements per SoC
        https://git.kernel.org/brgl/c/cebd1c0961d802092bdb68c591d4007b1b662296
[02/11] gpio: vf610: simplify with irq_set_irq_wake()
        https://git.kernel.org/brgl/c/4d49c80223fea433266e5b84464211c6acd86347
[03/11] gpio: vf610: use devm_clk_get_optional_enabled() for clock handling
        https://git.kernel.org/brgl/c/00e3c475fefd0eceb7e1e01305ae3587e654bd94
[04/11] gpio: vf610: drop unneeded header
        https://git.kernel.org/brgl/c/78b100b8a3d2119b141041ddb3fd358190c988b8
[05/11] gpio: vf610: drop unnecessary wrappers
        https://git.kernel.org/brgl/c/0cd60ba4dd958f343cea5970f237c80d589f4cd0
[06/11] MAINTAINERS: Add VF610 GPIO driver support
        https://git.kernel.org/brgl/c/c8c2a017ea2e656c3e85cf39bd2bfcb2f460695b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
