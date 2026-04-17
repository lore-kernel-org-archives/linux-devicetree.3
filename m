Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F09E327BFA
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 23:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776468784; cv=none; b=sJP6CXNGNw+ou2Mq9XSdP+tOpn9zBlqqb7aUDmiRRdGBq4imQszUeYMHEQVAT2xlf0/lk1hULT3JRsvoOMGftDkxQ2XSnzq+BYcWRjtr9nQ/ob5giycusp3N3wiFbr0QopjRa1e7hlgQ84NonwOAzVsBvQMhiwmMkFzyQm+U/Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776468784; c=relaxed/simple;
	bh=i6Ol9BdX93JIjEUQ23dcMzbXsAuBsHsR1913FVpkpC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qbIRPvIWWtuDPXt91NR4Hmnnq3YWtVOppAVFJN9oNZvkykrKUVeEn9I8UPMluFLdbL5GS/13UK2qbldoiIQk7uD7Xq4yil/UgplXR0iwnMX8f51nE2dmZFE1nFhpo/UbVb+sY2fOOD3eQJez87A750fqvuRjt8cFAPjmbFTnZn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q6rweTyl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ub8QcDUY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q6rweTyl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ub8QcDUY"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HGMe8Y3190363
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 23:33:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yGUkS1YC38o59D8IELve7BiUTp/N9+xbJVx/QVtxOt8=; b=Q6rweTylMVZ9FQNf
	pDnMIB2twbmgLnNIvMdOBoeIRrzM+QHSUjgPs4uLkTYmoi5N0y6DmWKuMQ/3LBAj
	B+ATX6KrRo7bobqdn2YudN0rbNyL7wdwejz1+IhW3xj6qQDHXe4Pyp6NxWEVgdX4
	a/kIuQeA1Dst7VGI7F9EGkVwDTEs+tpIoKfQCkdoQS7sbfCGui0Wojmlrrz6xx/N
	xxONnDzj8hLRXDwnGJzCQYpSrkcRWWUUrOGg5d4agSBsmx+h9fi4qItQNP/dMB1d
	dnN8stLz6hEPAmk7ewquLgxFTEszK75pcc6cIDOeAo6uPGJrL+5YDrHOm6AmNmWK
	Mmw4lQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkravh3cc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 23:33:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d8ed08aa4so47278181cf.3
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 16:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776468781; x=1777073581; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yGUkS1YC38o59D8IELve7BiUTp/N9+xbJVx/QVtxOt8=;
        b=Ub8QcDUYkteK+c/eliOJ4jNkB1qPMbpQZk4ZX+BQXgHVzcYlM3M+99HVMP+Tr+KH/R
         Ltpj4dOUfyxHG/BbwK0DcEdknRuCiLFAQ/pXs3FAE4cTcAloz1oOF9CkQnVf2Kv9UIa4
         H2Fmb8u+zY+7g4qI9u1WX3HIYw4KKzHkXixPociR2EWRnCbG8z0BWJAzLjRO1r1gZSmD
         W6/MVZ3lDVyA3AlObqZG3bioa/0f4OxahfgiakoC4ALEOBQUdSbol86lT68Rd6siWJSo
         5Okm7wzkRybSmy1tS8ruP6FxmHQN3/2Sld7NJ83dx+1pfNVTweRrUburc+Ebujy3Atgw
         tPSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776468781; x=1777073581;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yGUkS1YC38o59D8IELve7BiUTp/N9+xbJVx/QVtxOt8=;
        b=XCMyxL3nCxo/jZgadgOspyQdNB5Ag+K58X8t7LoKXI4zBCkp1LtekLGLa+xkBHESnS
         /jO/lkTJJiuXI8aNXFvEqxlizYxTMkpzZ+RbWEmDzv4HxIrq5Xtkn8Pm5cc+gGVTjad2
         IuIxykFsMySPPI+QYfoAbo013ydO5XOpDvE7x9oKfZVuobcdgFSX73XUxK+3q+TKewrr
         HkoiCLhkbyuaxkMtsNr1xP2kLMJB4Te1E97wedV2HMW1YJOeraTbItDut9w6tbcYCLrE
         Yc4tV9Mwz9i2JVaavarHnT7pS31ZPcCUcKgGcn62rr+iArqTjNGZCuZfc8IOEoaK4Qhv
         vHjA==
X-Forwarded-Encrypted: i=1; AFNElJ+j1MlLsIFehJwWp7mP3JqYIj5ZwCNC0rPpnrg22vKp5x08aA7aJus5IbkT5nEhfa/dsmVa2fGAVdDD@vger.kernel.org
X-Gm-Message-State: AOJu0YwoOOJIj9+UzUBWqwOOU4RnmsSYTf9dCYf+Gd17Wie4B5xTaItu
	zk5W5XR+Ailc1uyyW/4yNOE7YjiBKBJ1hCWax3HLT+wSyv76xGkxp1x7LlCNBkjhT18yx+jtiOO
	nKpao6en47/ByvxUxqByMepxw2izoxPEqKkEZJYfhA1Ur5ii81wRoFXbKQzT8Emu2
X-Gm-Gg: AeBDievIRKlNoXhqUT8glPl1DOd4bFE+R9i2y4Ym1PCYazqVTfFzvYxewCcHeBhmjIN
	RHGi3/Lu1giD+TJLdwFKQa0sb5zXKW7fj3dVA/+X8GNGg38Ksp0m/G8hy9EJdT/neXFhmdDv//R
	mvPEOgodZx++QusobiynounY96z/+siywUj6BwNjLGZRfzNu3876AWMxx4rpbxsJN9x6uqEa+Bv
	yQiqgQ5ls3SvHnm56K1k+e3qNWH2uCZTcg0XqW/vWhGR4eeq7wXci6mPn5qeA6FALXe9jIyUQCU
	awC/WNh30bzCCAEZwke9P/UWZA0WBg4/sbYWHcER79CYCKNjRYfiOxuvAkhS7ddO2djydv64GEh
	/G81V4+WvBw4eQ75r+fR4r9QYPek/oJR8JqD8MQYoB+zxjxvTdco6bD/XidSSk3p7ffLmbN9doe
	xKzlkG5lIa4QXW8EjGJepj4u9ARLA1CJ4v8J/h4su8Io6zIQ==
X-Received: by 2002:ac8:584c:0:b0:509:3098:819a with SMTP id d75a77b69052e-50e36c4ae82mr70599061cf.44.1776468781438;
        Fri, 17 Apr 2026 16:33:01 -0700 (PDT)
X-Received: by 2002:ac8:584c:0:b0:509:3098:819a with SMTP id d75a77b69052e-50e36c4ae82mr70598731cf.44.1776468781023;
        Fri, 17 Apr 2026 16:33:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185c8a33sm823884e87.36.2026.04.17.16.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 16:32:59 -0700 (PDT)
Date: Sat, 18 Apr 2026 02:32:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Erikas Bitovtas <xerikasxx@gmail.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH RFC 03/10] media: venus: core: Add msm8939 resource struct
Message-ID: <zhvfcwpy6z2rgpicnkvx2rg6huyqnen6q7imxv2fqjzc7k273v@oiqhebjgfnbc>
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
 <20260416-msm8939-venus-rfc-v1-3-a09fcf2c23df@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260416-msm8939-venus-rfc-v1-3-a09fcf2c23df@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDIzMiBTYWx0ZWRfX50VfO8BzUo1M
 /aI9NRdJ+2yVYn6JITExlZaLaNy7hc5EOVYbK1X5y1d2AyT1siaXe1k+SiObqRTpeAlPKpJE5sp
 +jlRF0Ua08q57mT45KatpFb4Jmv8H4aLyXEABJGsv48btARYqNlbGqFy95k6lx78HBx2vwiqf11
 qbidj5lK6XtLIMAKuseSWEkF4QdnpFAlUr61zEnS5D/VIkoZnRVJtmauPgF29K9zz0GHIUTZ8Rz
 pGaOcRAdrX91rv0PkbRlH7HIXgbEMhmwrh5NU0a0xmWYcbJCfcB0Bsf87ivmagfXByrkHD8hskk
 FA5QiHn6f7cC+dJkMQfrzFcleHV69DMQX0Wub/YMn9/qZRNv5P8hb0qIXmF15o9olEMHiONjbvU
 jgPx30n2vnCoeihaBDuhMw6d8b3KwcMKUh/6s5D7j/k9KFhdroeS4OyEGP3KUjW/6pIzxOvLpQs
 dw+nlGDLfMwvp4VhJHQ==
X-Proofpoint-ORIG-GUID: hOSFvAd0BnbHl1xymmLZVXu24UtFj_my
X-Authority-Analysis: v=2.4 cv=PIA/P/qC c=1 sm=1 tr=0 ts=69e2c32e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=HDjIzE35AAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=UowR2J5Dr4mKXK4zQ_4A:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=y3C0EFpLlIT0voqNzzLR:22
X-Proofpoint-GUID: hOSFvAd0BnbHl1xymmLZVXu24UtFj_my
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_03,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170232

On Thu, Apr 16, 2026 at 04:43:50PM +0300, Erikas Bitovtas wrote:
> From: André Apitzsch <git@apitzsch.eu>
> 
> Add msm8939 configuration data and related compatible.
> Cores on MSM8939 Venus are used for decoding, not encoding. Move them to
> vcodec0 so they can be enabled accordingly.
> 
> Signed-off-by: André Apitzsch <git@apitzsch.eu>
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---
>  drivers/media/platform/qcom/venus/core.c | 39 ++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
