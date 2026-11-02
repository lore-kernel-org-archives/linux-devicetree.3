Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612650;
	b=5HB5aMcxAZiKYtK7ArN0o2vGNK5P19UL1Y5zAlPUBSxxcpc++q3kkouUrQMMztjwQoxz
	 TipOSZUIZlJ4TYU4lTMBAdfoP0LZPElg6w2xUSnPE5cpfCl1BcW5hSgrWPXZqYsOf52uv
	 JrFhNhI55yOi6vdA468b/d/bdBB88AXzscK4kXhLfYwuJVkWe7WWLZ2PIWz+rYpCb9KPp
	 SkLl0OW3c9NL+4p+DIW+1IiZY9IlbZ+1CFgVumjN2sllHEXGKirZ4NqPIhTy3xo4nrMJn
	 0Tg6bq79memkNmUNLEccfQxpVDD7pzrutdYSt0LgB/4jvzPRBeMfRSJQ1Sq2EisR3Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612650;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bU/DWQjerLOuRj6MdmvOejgh96QzgiWPR0F31pcrakw=;
	b=mlHqnYD7vo+wazsTvWhvhCnrdE3KkL+oA7pxWG5Y/e/mi2Ya9sHufJydUkYC2BKom7ty
	 YGYhyP3ghrOt1wZwh39jA+0X9C5NfkdNqEGQLMK8ozdYzt5Dc26g5VNx79ValVbnnL2Bj
	 kOuiskQN27irB5Oq44x/BESSyue9ALSE8HvH3dwcyqxCWxUdl3p6QjZh15lSkXLgXKNSB
	 Q5spa0HT1gfyEuE7GybkGD14RLK2yu/TVPJ4+9/Hk43veKo2VAROGhQ1Zvj31AEgOxGI7
	 GNmL+CmtnOI1QNVUhTzMrIEkuLRZJ5VevsbrqViq/xBNMkNGABrE4aosMJ8YFfsJpAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GrixEPlB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="MG03/ugG";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14367606A327
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 09:44:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14367606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GrixEPlB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MG03/ugG
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AMNS1821130
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 09:44:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bU/DWQjerLOuRj6MdmvOejgh96QzgiWPR0F31pcrakw=; b=GrixEPlBQm1t6GaK
	LXHj/Zc2LYgw0pXEoPcH5XNfwF5fmWGE2STpSiy/yyGB9VX+55ZeUocjBayZr8WV
	Yv04fQOzpZvd360fKsauPBiU40cg/Hssc55ksZH3lAIArdUWbab/YxLxiMZNvLKB
	pJp6OuoxnsJkvBPwsDG3YYs0GNCTIm5OHuOm6T5bGD7a1k7m9OKeuEPAxcizb2Ax
	YBur8THyfU0JIRxrJogbljhPeqI2swftDUpzURnmjeH9cVQ3BN9OBx5Gx0oFvGc1
	9FELICUqdrR8xD1Brr0dGD6m9yEcLIGRCXhXppa3VxKC+/+bhKajjtX7QECQ/74s
	+i3VGA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpky4h1tf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 09:44:08 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91b8c60c550so77387076d6.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 01:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793612647; x=1794217447; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bU/DWQjerLOuRj6MdmvOejgh96QzgiWPR0F31pcrakw=;
        b=MG03/ugGhGkytqsi5TyyL0zbQ8uLVgJh9lOBWp6Q+nXsmUZ2y4UXNqAV3CHkTjEcA9
         1DGPM4FUGF8K9AQVUR+gyR77MtHjYiWu/WOcuAGXEJriZ5OlcrJYD+qMYGerZGLaMZ43
         HjJofSTKte0X7Vuu6DxP5z2UHRNysxJwggw2RaVk19E0KP8ZmqX/tR0f79QH0qus9W3y
         BII14JjasZRiaqcN0JFxblZgiR8bvMxxv1Xygobi7/1DklO+ywVyhcztzIMhvw0pBwrs
         o4m5dk/3SHEx6OlUDYhoP6znSN9w5iDHtJ0/vNMgD55J7zTBrWbSFcQKqXbagbGjlgb1
         IPdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612647; x=1794217447;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bU/DWQjerLOuRj6MdmvOejgh96QzgiWPR0F31pcrakw=;
        b=wDnJ4Z1SE0dIx8DibgqFQ3j02mqSFFMkCk7J8LXIv2lB9Cwt89FEtCwXCUdLpdVrbn
         C1l+ejhf43N4+6EV9SmFU13Kog9fr0/RpId7YTjsGHwJ88lP8TxCuv/tunok2c0uj1A4
         W2gB4Y2cOo2IT1vIC98y0pqqwVGBx3MKx1gSddBBIvjmllvuMWcCtehnRKejpkblwRdu
         LONlEg195qcBFTGILO8RWMfFbL8hcvUSrPpqtJ+TUqXFKbS2kINxLK2R7hCXSVroTJkA
         U3CqV5DGplOC+ZY+ggfKDb27EV4xbOg2jAbOU+/EisXeahVH072H1TSNSj7QpZ59Sdvw
         VKPA==
X-Forwarded-Encrypted: i=1; AKwUvBxElVD1/NwrQRbQyVurYqaIX8p7ZFVN0JwjjNAYbrAzt7POK5bwhPb3c/saLwn1SGH3rhylYH9HLioh@vger.kernel.org
X-Gm-Message-State: AFq9FYKa2SZlsUhxVciKOKOxGqq68Hs1QgK+N0YThMMCSQW1Zm0XhdFN
	87slV6o8EfsXVlc3OwFsy3HiI9EQD68J4nmFOJCGM0ptMrRPElBilTAQV3ktu091EkCxZj6wfLQ
	gLuf04ziTmjGfHskV+Vr85CLMtig9WZqzsxG7QJ19ISFUG9r13q4S6uIjoC7VPo96
X-Gm-Gg: AYBFou23PgauFsFheiFfhh/gAa5HeYjLeIGjWeb0ripBbJUPyLg6o2PXOz0uXF3y0SQ
	ZNeY/rCYy0RNBRNjffoQBFknBvqg4dNIilTYV1HHbHWVdT5nESjWkX9BAwG9v5u3xlVtC59Vgxx
	7vksu9P5WGxtW3S+Qi/1fmFJKw7435ZfcxDP+rGChDBBwaZKbILoSMlK7wr3Jw7W4Kf/M9LOkjl
	lxtd8vmB/FJYxn1v3FrfdlnTey3+Gz3aq8NBEH7566ac0/PtoUbR1NhRqPpvLdMsjWs0Xrf8H1R
	iUkx9fMUhA9yVK8XgFgVrfnShyCa3kEhqM15ezMIx3hAS9oh8sQjmmpfD5SqgrGa0OeTxEzEui+
	ZFGe0u9RLEmAFPA2BBbKiBgJACdcP3Idjuwr7gO13ub11JftxrEBPmLmmnlntgZCcSE5GvFQ/J2
	zY
X-Received: by 2002:a05:620a:bd3:b0:93c:6ded:4665 with SMTP id af79cd13be357-944214cb617mr1433941485a.1.1793612647127;
        Mon, 02 Nov 2026 01:44:07 -0800 (PST)
X-Received: by 2002:a05:620a:bd3:b0:93c:6ded:4665 with SMTP id af79cd13be357-944214cb617mr1433937085a.1.1793612646497;
        Mon, 02 Nov 2026 01:44:06 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80f04785sm334708655e9.4.2026.11.02.01.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:44:05 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Christian Marangi <ansuelsmth@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpio: fairchild,74hc595: add support for nxp,74lv164
Date: Mon,  2 Nov 2026 10:44:03 +0100
Message-ID: <179361262502.50074.14545801533564831953.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261023115652.700765-1-ansuelsmth@gmail.com>
References: <20261023115652.700765-1-ansuelsmth@gmail.com>
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
X-Proofpoint-ORIG-GUID: Cux_yzZ_ppwSLrAHMyKQh9ZhppzKHaw1
X-Proofpoint-GUID: Cux_yzZ_ppwSLrAHMyKQh9ZhppzKHaw1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX+AZHyX31SSOm
 dyOipxzu74a+481Wl/xEp04Yg6hI7W5OBXysJFyAufGmlnsFBCIr0AhYlHdTa6Ns63MAbRAvNL2
 N//zxqDs0410q4TCnb/x3E8etMgtOHQ=
X-Authority-Analysis: v=2.4 cv=QoHLTlyd c=1 sm=1 tr=0 ts=6ae85b68 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=cqVv7LrdKylAoqtr-78A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX9csgGhDo1ST9
 WG4Mxk9qZObFRDxYbYoVw2D9g/AE8aWn1HpRiOqaBN2HdjUOHRWMGG+SgqdV9zQTxZMYCWPgTgn
 CNaRFLK21lGZ5Id8nHAbW+ioJ+vYMUy8UvW2JWoV2E4x9PFPyCI2ejSwyzBKKHUHqgtImoVoCnd
 DkWpKDhOkKa5jRFbYLQ0ekCTGdNsusizz2W1cKN3NqXuLVt24IYh04PZA4Lj+HrFPd3zVVRl1T/
 gx28FWC/9CCucxfIH2wKML21ykaHdKz57zrZ9UkJOh5971Uo5eYksr6Is+XRcR2c/0hUM6dsDgY
 mbHQuOl+VMuQw6dNPOGGuCWy0PjYTImAkgAsAIEtd5AD1dhrVCPY/297cNhCR6UMZtbCbAifrN6
 Fnc8ulEIjqURoVEiIg86F1JQyoe8CB0cRkj4tqkQrAXVm+/Qnc1OLfLkqBbTvA1lFR3ethdqinb
 yJE5IDG1PACruGlef4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020038


On Fri, 23 Oct 2026 13:56:48 +0200, Christian Marangi wrote:
> Document support for nxp,74lv164 as a variant of the currently supported
> 8-bit shift register with the only difference of not having an Output
> Enable pin and a simulated Chip Select pin.
> 
> These basic 8-bit shift register chips directly change the outputs as bits
> are shifted in. Particularly used to handle multiple LED for basic state
> feedback.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: gpio: fairchild,74hc595: add support for nxp,74lv164
      https://git.kernel.org/brgl/c/861f010bf9b9daad85536d838257cdb690d94a30
[2/2] gpio: 74x164: add support for 74lv164 shift register variant
      https://git.kernel.org/brgl/c/d66b6b86d5a6278ca930112c634d03725beb7d9a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
