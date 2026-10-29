Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793269455;
	b=z7X/3UuSwKBLhQTbnIvZUWFEffJKzBUSy/opdDwa18mVCeko14AmK2aqzzfDX6IrvDXO
	 TZtool2hjsYlr52MPBqyyKuhIj84fZB14vffuoy87g5FPL9dipGv7hjd45sDGLGdEof4s
	 3SFYz7k9Qk2UtJUkBoMFKnXb+9F3Q/bkPLQH391YxWX259ar2ZwsznToumSlthb51FmgW
	 ZukmdwyLCvF/8YrDPqSfxyr9ynFdT9W8/n5sSCLIqclCrWhaGPALkgbdLcZks65MbOjul
	 Hi5JyFNQS/1TCDzFPOpN7zE0y/0qC0cWRiFGXEaWgWa6tg8xOO+R55wksmN3LcZS+IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793269455;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LNrIEX2HLFZvWx0hb7/TeOZv8vO2qpCvpN+LqCQcSDk=;
	b=kQMzNcLMIIQ/5pQSobt/EXSKC8k5WbeJHODRHKOVBPrX8Hi0TpxRDqHPtwuWvUp2nERS
	 ckdLjZjzizk0AzxtZUrPwpbSZHubGdHUHZAsP6VNGhgkeT8Rdd7Gz+CNpxZ/xcuGmJQhK
	 x+8TNpmNHxqSqsYH6ZIAFVR2WR7y9ciQ0hDZhfNlNOEfspkS7ZjBdpjL3wu3ltn7GKbNV
	 olr8P9VTnWy/YD7h9IDctnO+Q1BLUGGjx8PrKqdte6lI9kZ6Y6muJElJl9Erj0VIJo45C
	 grnm22Ggwl/2+EMXbM1t2DXgkvJWAglKGa6nEOb4vn/vwKs/rdIWEELwUoj7CqogH2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WPyC5VYU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZgziJLqa;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22ACE606A31E
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 10:24:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22ACE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WPyC5VYU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZgziJLqa
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vWY3179557
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 10:24:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LNrIEX2HLFZvWx0hb7/TeOZv
	8vO2qpCvpN+LqCQcSDk=; b=WPyC5VYUubHpQEMXJRE9GWJ4zuY3zgsVgzNb8E6s
	2QBuhmjbM/EwxQwjBIwlxBLTmcyjHDs0t0tj5gjrRlsZqze/e2zv9bBHjz5ShGR7
	76WiMTlgF9K+WCPlXMxch1M6wO2v9jJfHrMwsOOWR9x+8aZvX161iNZR0it5dGNS
	Kxizbnl6tsmkCpFawBuqr1OBezAsFhwELNfWSaSWdmIxTWUD2r+taCfqcJ6PZ6cM
	S1u5E56GL5O/2iEm80fPjTQvZu5bTCcf32sz7tT+cUfC2FrJNhHwmEOb8IGbqbBD
	kgjgO8ejkBGLLM4o3ixxeJIQ6vsYzt5h4W6eAuJPbwmkEA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkpmc3304-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 10:24:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb6391e89so369275585a.1
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 03:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793269452; x=1793874252; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LNrIEX2HLFZvWx0hb7/TeOZv8vO2qpCvpN+LqCQcSDk=;
        b=ZgziJLqaAY6DHyANE4hvLejnsK0xeaSDJfOT4PALWPvLLhvGfoXmn+GKZ2cbM4zbOt
         5Uzg5OSAaFj9XCpBc5bUgc2plC7Jlv8MY7yk1eX1o1fOkp9HTnu/DhDwmnKS6pU97JlT
         q6el2t4YIo5mb1UfeaRn4xH09QBCYHE4JzhbSJ4iGM7b239ldTzxKaMZHz9vcHwHRgLT
         nDiqfH6VW65vytZa6mo088SlNt+UPBbVvZf7h9Oh1R1r5oVfAtkIBcIbqWfVppAKPNaM
         6Vrz9GodQIBH0YdnTeL1yTr4kFlXub0A0+tkz1ypjCJ9utV+6j+l03CaohOA68XZDDVw
         vK6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793269452; x=1793874252;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LNrIEX2HLFZvWx0hb7/TeOZv8vO2qpCvpN+LqCQcSDk=;
        b=TAfv8aNki9ZQDLjVxIb5FjRyKt444gVBv3tYJRvRAgK4G+AICukypS8tbsOJiqtRSm
         OLZ2Gjd5H88dA5tr2l1BcPt/uzBNRNOn8tSXF5dHGINDAGDpLFm/W1xb2+Ly6vzACJtW
         IGP3RMYv5uqWFp/OH2677yAQkH2HgY/MsOr9csvKRwvEQISScKlpKQbuerwmbNL9R4ci
         SesXAUV3vRNfyaMZ7mxOF+GedxXSjqkTNPfsCL7nGXzRZ+V/6jh9zE1kbjwcdolZ0/H8
         hlzZGqkZJPkSUB0QGxHx/umyrqemytoHndH1Hcv/ps3P+b1vtKPCwo46z+gFv8s0vbMy
         /GoQ==
X-Forwarded-Encrypted: i=1; AKwUvBwxvnklZWJ3gSkAnzESZuoGlv7WKv60JqK8YDtbY+mrOwLVp9yI/D8gXKGXfSUcPrcenSXcXzLf5PRF@vger.kernel.org
X-Gm-Message-State: AFq9FYL6bYtnV39iIqLPlz4E19egwGJNSyyK7Pew61LvVKjHewGzhUYj
	8UtorILbKtdxTsqrT2g1av5qQQtHnyhMcalR9/DwB7dADkd63/NQ07voFK0JDDN05jSvftY44Xa
	XmBAW9U304kUd16yck0slIA82yB2/iUHcqiYhn9EQPJBSS5mREQl2AQQLiTG7wbN4
X-Gm-Gg: AYBFou2lqkrNo6Fx9LUy3P62Nth3t36arYNISnMXgyUYB+nDCy+gebZ2ECfJ5aXJ4DV
	FAN/Z7O3+NTxHyJlCXkamapQ+FzN6seFwyE+ecUBV7LCdwxPp7h+PnS6NtspLbdE9gFLmKZzdJS
	cy6JtkreMOtpipNCW8CpH47yuXQwby+SzPovN1I7B1a5bZyipdTnJLPPOrjk5/g4ztKpn7H4zih
	BotPmKG7FwjgvaRAx/5V+KvOl/Pkq9g91/drBImRgz8yrb8zM5AWVziUVCsB7DyCIll+7HiU0yC
	5qdJ6I5qGu6YWRfwHvrvXU6jTs9nGuYWthKWz9i6IShiS1PRZIx77VVsaXPOlosQhB6zPIStSIn
	YQHS45kz4/7R/Q0fRIRgq0sLQ/xTg/do7CHZKHspKPosEaireIwyh8uREd3eKPVqX
X-Received: by 2002:a05:620a:3703:b0:93e:fc4e:c490 with SMTP id af79cd13be357-94408a6ab94mr766983685a.15.1793269452236;
        Thu, 29 Oct 2026 03:24:12 -0700 (PDT)
X-Received: by 2002:a05:620a:3703:b0:93e:fc4e:c490 with SMTP id af79cd13be357-94408a6ab94mr766979685a.15.1793269451464;
        Thu, 29 Oct 2026 03:24:11 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb846sm33789347f8f.25.2026.10.29.03.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:24:10 -0700 (PDT)
Date: Thu, 29 Oct 2026 12:24:08 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v27 09/10] arm64: dts: qcom: Add psci reboot-modes for
 monaco boards
Message-ID: <f7rue5rri4gyfs3ltczakyonvejyubjbocwabpffez4wnjolf7@b2hnrwwp6mil>
References: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
 <20261029-arm-psci-system_reset2-vendor-reboots-v27-9-fa4b3ff1359b@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029-arm-psci-system_reset2-vendor-reboots-v27-9-fa4b3ff1359b@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=X4nHu2Te c=1 sm=1 tr=0 ts=6ae31ecd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=DZmtaFOGBJufDib-chMA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: XGQDxsF7ZxxV5UkPNd5VgufbKzmK-EFQ
X-Proofpoint-ORIG-GUID: XGQDxsF7ZxxV5UkPNd5VgufbKzmK-EFQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA0MCBTYWx0ZWRfX3bK559f8HCtJ
 QhnMNmNjK9z/8lNdSvUTIXkIMZsFSqQWzBiryQQ3H5B0uj7KPvgEQCAlCSMs69IiRTCIiVI794r
 YlEgt/gFX72RcCx5FiwWsizHrV+plD0oAlwlJijqPfyH1R65qq0A6A/IjMXwPnnvvNad71LKxpO
 dtNd/xFCqdK3ikd98i6w36gLNehV2yElg4Eb7gg8swLrE4QGxz/i5VJy4u87+IKhrk1ZY3z1ZAe
 pwJelTSm9TIuWbmRnva5NK8XruesjGraODbSZ+bTVrBXkougUTdK3HsDUizRIIHtf/L3WwD5CX3
 fao3J4LrdxEzojnkBWPup7GEtp6tz3d7K4GXi0ISQIeQBM1ciSZ/7FW0Js3Dib/AuO6iKfaBO8D
 nwnYF2AK6J0wVxNpJDpOqQm6f3y0jVJe3slKr5pllzaDBRRzAmiurZFbnw17pEPaQzg7ebRNnP3
 flkdrKJolLiR9lmTuXQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA0MCBTYWx0ZWRfXywHyD0Ba375p
 13HuPy0tpLKF1XS3f7JPflI6gYTdI7wjLDFYL/oW8lXRSAIbTi7o6b9xpuSk+4As+6qSKQ/7abv
 xZHu5XFtIm2Uzis+Y147n1HFm28+cos=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290040

On 26-10-29 14:31:03, Shivendra Pratap wrote:
> Add PSCI SYSTEM_RESET2 reboot-modes for monaco-evk and
> qcs8300-ride for use by the psci-reboot-mode driver.
> 
> The following modes are defined:
> - bootloader: reboot into fastboot mode for fastboot flashing.
> - edl: reboot into emergency download mode for image loading via
>   the Firehose protocol.
> 
> Support for these modes is firmware dependent.
> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
