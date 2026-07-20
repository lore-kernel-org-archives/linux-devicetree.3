Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A57347ECF3
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 22:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784585984; cv=none; b=Dmmgb7wNuLOjSdglUxsjPvGnk9tt6jjmP3Z4wZ2v0BaAKlIiKe2UX5JOcmr/yQvlV1skIBLjMadkyMsKFHok2sbcheGJINC5CwSr/4+2uxEkGev04np8xe2W6fT5I4Jd0JBr4/8X6U1plXLqlFDh9+UCJ8QzGGrcL1SFxAldhCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784585984; c=relaxed/simple;
	bh=bm7Z9TIfufzBOFaLpexxq6FROsH79ShJEvHWwLi1ONA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bygtaYUYrHpyhWJ7X1+T4YzlmYQOBKIuE+BQ2LTrFJbNyd/SURnLwVB59VUHxEhxPin7UxvJeHa2KbizDHnz7NGrMBAk5purT/NiBh/OpQlQ3e36eyJol+br1YxeB3hmmQI1+tk0MwWeftmbnBFmNJToUXQONyI8c5Cy8KGPmZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WHoFPChd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QqU0vaxm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WHoFPChd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QqU0vaxm"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KJTct13106597
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 22:19:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OCWivWDLjQUU4XplDWC2MJ5V
	z3OXYDvt49Wj3ddVztE=; b=WHoFPChdKRgCA3qmZiF+uleQI/6r1ShbPRDjJZe6
	zt09Gfqdimuobpa4tPi1k+RCUNyANIZTtzMyPIzBhezxUw4f6G60JkNHNb/njKZi
	M8fUBWtzhWom6AwlupD1yM4TOaiMbujrcJ7LFBX87YEXZSqgdAg6g10KaPuCjM8V
	TvnXyf1Pf8GxZWJlM8BzAOQOCqGLKmTY8D/JuI4XFITIao2u9JDFn0y+Lf8BZ8/q
	N/7KIwGo0Vg2MyRDXz6BEkCPW0K9N6PmU1fWPzqUSbcEDKy1VSJXySCXiRuHg/wf
	/cRgD1QzZbSbzgyJ35PQM0Opqr84X5ePzAuoegj4KGSDDA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhgs53a20-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 22:19:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c26012cd0so188414991cf.0
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 15:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784585978; x=1785190778; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OCWivWDLjQUU4XplDWC2MJ5Vz3OXYDvt49Wj3ddVztE=;
        b=QqU0vaxmWE4D+HUkThVg7i48ezZESVpashDLuZeoWC2KDh2mS6J8EBjaZrwBrKelUa
         U2kQMe/7MYWYEx+7oy3VLFmJgGbQHyDmwlGYKyX/UMZ/xsCZ/n53gntvXVVPHKpay14Q
         HUAdUNTUYiHEnWIBWq+Wa8a1eAFUwjbAMB54/iRaGk7LIPBKpOtrtbeQ2AZqz+ch5JQy
         gpSbVglKtl5nQjBYe7ZWGJjaDlFGpuWQkJJZjsSeZXjcUlyJvM/Rtga2quH7muNL1omX
         HLA4bRjDmSZ/2XyJaemiKhvCAWXee7GYkEJAr+Eiry3PkVArGpGa0flrkLnxrm+fWbHN
         RoIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784585978; x=1785190778;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OCWivWDLjQUU4XplDWC2MJ5Vz3OXYDvt49Wj3ddVztE=;
        b=sd8tO/oxPoHcVrijOXTgQKPrNLxYYgIaLPvkMCJhMtqSwg0X9Uo36SISZS4t9GvS3O
         ZuZNHdQvtRT6xRWNHqclwZATVQ1nVPQgjl/EgZVgu9z5PbD2y64CWsXWaVQFmcCg8HGO
         Y9MSJGR4SWzOUMa8t4+85rrM8E5weWPdUkxdoAeuLdMD7j05+i3pwu4E/ruZLp650uZX
         1dvMoqJdWIbahFMdlanQ69mO2ouou/FvmTshA15D8SJyk/6u0/aKsW+7gHZzwwFUOvY4
         Nnp/J0J0zCy29L9mIMVdR/GeAxxCavLlDBY+PZM1SX7l276zLdzT8cGRyBH2J8kPkOCN
         o2rA==
X-Forwarded-Encrypted: i=1; AHgh+RrPp0Db0WmSV9p4JvHlhoedOsaW64BRbOyJ5c6wHCbYE3r8uKaisiAAMLpj13yPH/hPEl3cHwQYcg42@vger.kernel.org
X-Gm-Message-State: AOJu0YwKkbxg0PMI4BH7dLuUBbajh6HiC0juXd9sRM500DAlc6yUI1Lh
	gzfNqvSWGCj+C6I6E9hUN7pYzJ5M0bkfipSyuEHen3m6GmtnD/Fgc6Anfa0BxIik7kI+SCDFxsu
	eWHCjSvd6BOwZH0fRkBoMMTo0E77ihAiQAHxJdU7yzZW6f4BE8oDhn61VzRmBpHbw
X-Gm-Gg: AfdE7cmMn8LzOkRDjWkqbfi5BYjm1VoeXdjwS9BF5jJLTU1udAXXlqITKJsi/gWcIJW
	Gp+6T8IdW9SbYu/tOFw0N3x6DuF5rNYYqN+wcruWr8sEqxhhmSimMijp+5BBQNWq8Cn4kAmop5R
	uNBsJCI664N62ftZU7j6pizP4rSaFYXjpDcRoyKqczFQJyQD78jW41NdQv9g72ZvH+iFfweLH1o
	fQ61oP4gawJiS7I7aLtQyCkgeiXLgRjosz2uQsG0tgtrfxyfaKNl1bLpM7NI5yKyqqxtrjQ+Kuj
	HpZqASoquW2BLQRgLxAIOlERQQwjjJkICVOSUZB0w120YAbe9Pbwx+bWNv+1/ugBkYNAtdZ64N2
	Oi08pcXFhck7IniJ9k/WZN4ujGuAeoMLpYwAc8OakIR+u0F9oVgE/wns8YhgupkCBZBLiOnYA0f
	PnjuHnoZf3UKw1xg==
X-Received: by 2002:ac8:7c42:0:b0:51b:ecbb:206f with SMTP id d75a77b69052e-5213c205893mr142515711cf.32.1784585978338;
        Mon, 20 Jul 2026 15:19:38 -0700 (PDT)
X-Received: by 2002:ac8:7c42:0:b0:51b:ecbb:206f with SMTP id d75a77b69052e-5213c205893mr142515321cf.32.1784585977831;
        Mon, 20 Jul 2026 15:19:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291daea0asm2540232e87.34.2026.07.20.15.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 15:19:36 -0700 (PDT)
Date: Tue, 21 Jul 2026 01:19:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Anurag Pateriya <apateriy@qti.qualcomm.com>
Subject: Re: [PATCH v7 10/10] arm64: dts: qcom: shikra: Add
 gpio-reserved-ranges to tlmm
Message-ID: <5houmyc3fu3grxqajn6ivucct25yz34p66lwha3icmcuj2fb7f@ypz3r3mqwzwe>
References: <20260720-shikra-dt-m1-v7-0-7dc99100c6dd@oss.qualcomm.com>
 <20260720-shikra-dt-m1-v7-10-7dc99100c6dd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720-shikra-dt-m1-v7-10-7dc99100c6dd@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDI0MiBTYWx0ZWRfX/u57Nz0fOQv3
 4vUCig4+JvkhrHBt68Ja1zNNt0W0nLtepMMhDd+nBpUE4iDulmymoX2dggq1ALBF7ZR6m8A5UF5
 08S+rUMrjyPUx6t30c41Rjhxb/HDtOE=
X-Proofpoint-GUID: RMCqljThX4NkBjxz6w5XJpnWt55XCa7F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDI0MiBTYWx0ZWRfX1qxI8yMsiqn5
 a5cc065HvuXUylYWMSLKnN3hH9138j4YLYgKmzrukc4ah985WOYPHubCkJo4H1iN0FydpwBNUVo
 yZ5TUgVlNZC3/L2o7tFIXjgYcfactMFtmTJI9J5GdoOaOH5zASmuOObc1HNK2YZDZaxRVNW51Ta
 7aYg3kE9o/9dKLMMB8buCZFHuOZmU2iQrpTZWCdvQfRKA/65ek+8n2ur+zbKUNQ4aosz62X0c7w
 1L50AAmKUNR0tL7oUkM7Ma4OFg0Nt31iqVT17qyw0NnEHCSSqaUhPmU/r+poDszBBNv3kGR11rW
 DtyV8ufRn0pNuuQa18KpVTFPCEX9IFH1Fe3F4NZ2EA4CFAXQyYxOhdaiq2JJM68a5D94zWGUdOe
 3WxofOCQwEJoeWTRKpDy3FeVo5tL9ahC6fuICGGk/RFqmpQhwtN6XxUxo+XRL+a7yIhff2Mep7X
 8BNGo2mSMQVoN6HoK1g==
X-Authority-Analysis: v=2.4 cv=CpiPtH4D c=1 sm=1 tr=0 ts=6a5e9efb cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=s9XTQAQIpqgTDh4RU28A:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: RMCqljThX4NkBjxz6w5XJpnWt55XCa7F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_05,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200242

On Mon, Jul 20, 2026 at 04:19:26PM +0530, Komal Bajaj wrote:
> Add gpio-reserved-ranges property to the TLMM node for both Shikra
> SoM variants (CQM and IQS). These reserved GPIOs are inaccessible
> from the non-secure world and dedicated to fixed functions.
> 
> Signed-off-by: Anurag Pateriya <apateriy@qti.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Who is the author of the patch? Why does it have two SoBs? Should there
be a Co-developed-by?

Other than that:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> ---
>  arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 6 ++++++
>  arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 6 ++++++
>  2 files changed, 12 insertions(+)

-- 
With best wishes
Dmitry
