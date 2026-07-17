Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3E13E1736
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 08:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784278740; cv=none; b=J/vATuLfhqUobMsZFnBjh3AekNEsxt7Xbafb4VTuqE9CJc8fz6wLyrpDJybKF3++HVoAu+kIRp/jqOk7964wIo+ZxoEv4mkKsI2bULgFAzCkoJjGPdxm2aaGa9uNwKAUIJS5+8x8otfadstoWrvCrssGirZrpXF/M+buvPnRnRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784278740; c=relaxed/simple;
	bh=iKr+ORJN/0HmCwv5NrZPcwiCSwGwPmGXsiFEI46TzZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VhuwsRJREDB8c2aureawi62SWylGoJUXyEr7Hqlq62GirFp+K1wgFTsEbrfEhi140xPY2ybiuYtb/AItqrgpL2ssSC41QouVk5LDh0hx8/138p8mwl92ngpi8uWgs0vk9xXddiNh5j/+uNhCsUTYL5eg7rfq0sv2TQcXnqKz0PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l400jifc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SEtOBm4/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l400jifc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SEtOBm4/"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cf6h1078348
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 08:58:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V6MbJnmX7m7Q+rNiwCmFsJ4wLFKfE9U7mLaz8j8CV9U=; b=l400jifcL5aKd65B
	5LUw2Bc0DKEUaD+NP5xqtPA0B+pUH7FOZJXvTs+5QjLB6A5Gg8elI6ZNoyfPveE3
	c6jq6vIIbzxH9mI9jgJ3j0N+TLBSoEiiPaWzLOHUlLViZNgsZmc/WjtUN0Bh+1wD
	FBsECLyhP50+rHKfuAww3lq6pCtK3FMsoNMX/+5UPmIhIgCf+34zN7ItdPiQRVn1
	YuBZTVahOP5+znFPqWN37skx8eW25UhncLxEY5No6gd7D2EJk6mlPGaNSy+HmlSv
	7ZU/elCzCRgFqR2DaXZBaHSiUoaiCj/LdbpP9HjwCRdDBT6RXnsOPSUQ69WmcMTU
	YlF3BA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feym1ca7a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 08:58:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0e702df8so91937641cf.2
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 01:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784278737; x=1784883537; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V6MbJnmX7m7Q+rNiwCmFsJ4wLFKfE9U7mLaz8j8CV9U=;
        b=SEtOBm4/hnGL9sPKUVw8C0KctLCeClf3lpLteGqHro9v66g5E1iMTGTUtCsLhd7CkW
         +zfzkIvZoEcyCrbM9DS1pYlO6Hgefh1W6d2i/jGJCMrB9Nf7lgNTZHyYjHFYX08wTddZ
         TQJeDpEqiXeYrW7NCye5DlcR/20LLkPZWGzzLuo6iX8BQN2OdkLbcyQUMXGzw3HDUGnn
         3WjdwvY4NZFfGquxQPlfympBgv6pg+1Hlh7et/F6YrAhQ0vOf+Xa1fkSNyzl0x+wan7C
         FLbGDPlNKiigxyk+Ug5HfN8hSwtYM4ighpwD+IXmBMRsxP924fCcPNb6kpISQQnQNVTW
         pp2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784278737; x=1784883537;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V6MbJnmX7m7Q+rNiwCmFsJ4wLFKfE9U7mLaz8j8CV9U=;
        b=IaJDdbS9piDXNhsWsJ0O+wtuaLhtfd/sAQTwTcS95qVlyW1j9MqU7CH4EnpMOu7icf
         HNfJSvBvfgZnyc+I2dhga+WegVfmFf9Cp+JAIqclMxbkTNle3ad2SfLbx72/Z40oMEo+
         R7b/ror8ilNa+bSSLppjj68/wYMytANz2/cTDNG1sd3aSKKss9DcNClYcyoSN/Ke+OFP
         mRKM8bQ09I+MPsjrVpbIn3BXqDvuCTtQRQezF1fumZ9svFs6bpkGynhPnEdtKiMl5hBd
         1XKaD+/0NhiqU+kRrK0k+f1dvqpBJ7JxV9X1nnHeVPxUiNcPk1TZ/9dsnlrF4wVok93P
         wdwA==
X-Forwarded-Encrypted: i=1; AHgh+RoZcxIhcWgj2IIlLBpuhQyh6F57HKjlSbO7VnwJBacKBNMl2hvVEBTlW0r6rTxQyFXgkZcpLi5MeAcc@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4MnFhn7Av/H13dSWYWsb/kJvVIuxCTsjI6wIY3LY6pN9plvyn
	U93O2B+iaS5sUmObj1VjRwlqGsZnOOuTze/2TaZYNof92QX2JiZTS1Lp0YlvMyLjcOtc9BbwDVS
	Iz9TeDXhq03mUq63xiubivCzIMiMIUEKR6C3oR9ixMzCr0M1xE8HWxejVWiHhaMo3
X-Gm-Gg: AfdE7cnUtlTxhFW2W/HHNE23eX4GLFCg4JrZazKyWEMTDnqVJpENexEa4WbuClsBw0r
	m6p0e9KpImY9ppegQTdQ7Ht0Kn5pG7DLzhmusKEOnNE5zxp0d7zirGp/dIeALY0o5QCkpRzCD1N
	Kv/1gf9SGha1oROlrqsj018uhi2cQpMr4TXIKl1GygwWvrh+0LWqykWJH2yIpvqzzkkJtuuhCyo
	n+5i34ozJ3lOV9+usKlfXvCyvNytmSQKIhoUW+GDQNgUpOaXHih10my8hg08h+GZhpmmUlnhoNH
	DDOQZHyB55+6EvBh6QpCSQ00Kpi5SBE5R1gxEptuBE4sg1wpj2BmOiVBRb6q6L0/Y9FHr5bJz+t
	HXKygENVvL20GFy5OTCdUqZ4BZJsS
X-Received: by 2002:a05:622a:1346:b0:51c:1eb5:333d with SMTP id d75a77b69052e-5213eb757d0mr12604721cf.66.1784278737601;
        Fri, 17 Jul 2026 01:58:57 -0700 (PDT)
X-Received: by 2002:a05:622a:1346:b0:51c:1eb5:333d with SMTP id d75a77b69052e-5213eb757d0mr12604541cf.66.1784278737262;
        Fri, 17 Jul 2026 01:58:57 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:dc44:5b1b:5396:79d6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63e65644sm1911449f8f.16.2026.07.17.01.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 01:58:55 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Jan Kotas <jank@cadence.com>,
        Michal Simek <michal.simek@amd.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        =?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Frank Li <Frank.Li@nxp.com>, Boris Brezillon <bbrezillon@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>, Swark Yang <syang@axiado.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-i3c@lists.infradead.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-usb@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: (subset) [PATCH v3 0/8] arm64: Add Axiado AX3005 SoC and EVK support
Date: Fri, 17 Jul 2026 10:58:47 +0200
Message-ID: <178427872043.9452.9219608850005529427.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260716-upstream-axiado-ax3005-upstream-v3-0-c429095143ec@axiado.com>
References: <20260716-upstream-axiado-ax3005-upstream-v3-0-c429095143ec@axiado.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KPRqylFo c=1 sm=1 tr=0 ts=6a59eed2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=zGYnv34WkyyXCUjmJXsA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA4OSBTYWx0ZWRfXyrmCYUB7JJ9f
 8IgnYEkzDvSfqr6SzQ3qugY6tyYp+H6Wmf2VxPSQDHWeh0OEQhOgHQOtERmZVHoaoS4z+zfc/CV
 7KatcOOnCPFmNT2nSJxME2C/w8MP3jubPkesydrhb9hN1RxSiYE450fA3J3gCZmqWVklPQQTJUY
 40DbjFkNEy62nNAFG9arGWnjgI+SJyU6S87O3xUU5aSv7vTcoSTRQE2EFTw6NbySyRyJ99Qa4bI
 ochbnxsGbzzrl0d6cPPHi/Bdsj5HI9S9UoitiophmQHvyv7UZntZfX/x0CCUmbqpdOfnY1WFj9X
 OIZyA7q6eSEgWdl7gdgCxky9nLwIShL9k5PDgx+SUMqY+8m0SthRifdjxi62CeA2BNd+h2C/Q/o
 8qmOjo8NT7IvXQTCS6u+fQLFI7VefraMhaUOsqm53R4I46/JBIb7mkfxJgfEJtY5v/OXgzsAqU6
 zuq1ydTfX0344wZFAXQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA4OSBTYWx0ZWRfX9wSAqiDq+0/1
 twfiqF+2ewhIoG3jk1ZQ1fIPrrJEHvPKcAT/J8tWr0w6bZp74RHm3c+/JIMvoz73Zof7uVOeIXM
 f4RIV+5GvLhzDaTVEyv/AKKH+WyjnB0=
X-Proofpoint-GUID: SW8hXiU9I31hGJiM_gC6NZSf-LhWCYAp
X-Proofpoint-ORIG-GUID: SW8hXiU9I31hGJiM_gC6NZSf-LhWCYAp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170089


On Thu, 16 Jul 2026 20:51:07 -0700, Swark Yang wrote:
> This series adds initial device tree support for the Axiado AX3005 SoC
> and its evaluation board (EVK).
> 
> The AX3005 uses Cadence-derived UART/I2C/I3C/GPIO and Synopsys
> DesignWare SPI IP blocks. These are already described by
> existing bindings, so the device tree reuses the "axiado,ax3000-*",
> "cdns,*" and "snps,*" compatible strings; only a new SoC/board
> level compatible is added.
> 
> [...]

Applied, thanks!

[2/8] dt-bindings: gpio: cdns: add Axiado AX3005 GPIO variant
      https://git.kernel.org/brgl/c/e8a40b3566887c1c83d4cb87058d4e98ec8b4a14

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
