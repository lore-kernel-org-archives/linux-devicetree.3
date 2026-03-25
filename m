Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE2837B021
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 22:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774478498; cv=none; b=VULdF5+lChBQgFDzJ/bEvVRWvYH8UKP9W5HkrRdOg4hiL/sNTv1rMBTEPtviCn6MIDxXywXvoFduHIGouL0NVcrJypxWImyF9xvTMFYdXkUqNmDVd6qfMagyXMOIxoycv5OmkF/16zMdPGRZV2Mr3Dn/nRXWqcakD64wDX42Krw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774478498; c=relaxed/simple;
	bh=reMknFJoiqNp4mtflM/9KnhX9fgjE3GRwZFkcGD+Fb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sj6NVP0aOrSHw516ajwQP/UGzECf+ffjYQ0sLVSMjQJ7hVu3bqPR2ZcUzv1uvX1lUtSMGC0tfDlnW3inEdeApaIU80ULSxMKpnKntk1fyJO1AGlvSkjngoS/dXDF6TaJI9EeQrreHJdyrYFLL7JNlL4DMEHva2/C8hSUpP4cKfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n01125Zb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IMYiB+qQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n01125Zb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IMYiB+qQ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PFHHc1779733
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 22:41:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MskXGsEUY9X26Q4Lhi8JX7q2
	GLBZq1hRtzx+iwBExXA=; b=n01125ZbN+KnMlSr+OetFhmadiRmMt0bJWr64P00
	89KrmUqKceQyI3RUVdKojgF+ZgDVUui7OcFniBTrtD+Iz24GdHc7doAns7E9CiTk
	nt/KhkxExEhNozicRlFIC0CrkSuqG8Gsu7vWOUNpLejYRkOOmTQrdLwkDjN9igap
	iJK37cBClmOt7kgs6JvhImYfbIWAulo3li7Ybuh/sIlHxHs4gyz6n5zgGuu1kVTn
	hLC9y5iz2PoEWn5HEijPeBZTfS6P2YtgW2wAjE1zvAFpQAo+/++1MHyWBeDAvDP8
	+igEx5FTlJV9i26rCyMGYf8/R4y9/FH9XL6UIe5uJjmAfg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4cvp2tg2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 22:41:35 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5093787e2fdso19821301cf.2
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 15:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774478494; x=1775083294; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MskXGsEUY9X26Q4Lhi8JX7q2GLBZq1hRtzx+iwBExXA=;
        b=IMYiB+qQ57eoKocLtiELbbp4jGW/ZGRka0bjB2CRoh093YghlQKq2cWOgmtlhLQE9Y
         kdmREAF3W+iigqOvD+RzUc87L6GIJ0W8IWSN6YyOz+yCm3qJVyEBDMpCpMorqG45kIrx
         pUYcZq/w5EIO3dmlXipZwBJOFG0OC8DAW87EEB3pZ52CA1kwmsxQl6D+VkaXyRpDBw/9
         b82EJEtvBlQ3Pom64I/my7z/UCvSN5vC/RHlZi2Nw8Kiyi82D1yvT88yA9GgfKSo8FXw
         S5HE+TvQ1Qgd6SQ/Es90ncOGcLPwUDdPw5e65uMLEeovMHs2K6PmuVD9xF3VLXOxxhJN
         ip3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774478494; x=1775083294;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MskXGsEUY9X26Q4Lhi8JX7q2GLBZq1hRtzx+iwBExXA=;
        b=KwxeZwIeIXfWQiWpxTPUDHqJkCg+44O6y74VLMwj2TkMFgqOOh+zNcuaDOJbArM2Ru
         Rv1Eyo8LpeOAWPWjoEnYgqt4S2tJazQQGnS8H1cUKx12HpdJc5SxO4TyAm/qz1BcONdW
         FcFMWReAu3T0Fim4KkZiRcncAd1THnROMe1YkfL6PKQx1cJKOKpfcWetpACx/NlMI1QU
         ToSmdn7/tokyV1UKj4vXUmywTyXznD3pTXPPg4Fd5u6NV3BYfYIyesPy+LpPil3/xO6Y
         vISzoJdyPMCt3iYX/r8ts8E+8lDM6jyUWPOxhcg3iT5aZDZSbYGja3NTepE6nakEGIpq
         4ZXA==
X-Forwarded-Encrypted: i=1; AJvYcCX7SrYKAsUvjvInnmv+fxgoYy80GZ5GMxf2qbhyffyoLr1cvrOIaEM8cOQoRHbM5S3Y72c8w3uMAoX+@vger.kernel.org
X-Gm-Message-State: AOJu0YxnGW+WEdzMby2ysaBUskoB90o+VT4S3VZaGP4aIjdx/BQEAbEJ
	eEy/UOpbQoQmVPlcnbG8zVlHms1bE5fbmXmT0oX8DYFblQIyRZ5bTKE9NLNhQTRd5tQR/hqlh/m
	Im09J2qbRDz83AD9uqZCDiSIx9TSrN/iqwSlsr+Usvp7dLgzSn6BiMWhg9DwQG8u2
X-Gm-Gg: ATEYQzwALGFSmO4cFQxjofmPXg27JZ3olEXlYVKvLJUOSJ0M+AjlO5mdce7jpEjWNJS
	KURr4yyMH4y2Ip5QkR/4jAwQrY5SXlqj8bMVVtBgBvDRumeUMEnAFyOOWQYuUw3E7OrOsGRtTCK
	wm1Gi78f/dGUwDghtHAHO6zxRBFLGUAy8sOMdB0H3rzjw74SZR/4qcurN68CqdK3Rk3hv0YfNJZ
	rroFLOCMoqQaKDBEZjYCxxxQu/YC5W7Ju4fqKOWEJy4x+93fGTt+fmWsG2SwUiw9av7yGHeYXpV
	8QoiyfbEU6qjMFU3tRzei87H5KXyeadDLSo1TWeUukDYECTnU7lKVXPrsGyt7n9XVOwRKBK79Gk
	KUCv7/9GyCx58WJaZZNwLmP94FqeFR1XX3H6XGHZGmSWfYQsaJDin1GEHucYtHQzoSQlc1IH60P
	/dUTJfqlAMnw3X04z+MeV9wb/Vd9zOrX1rYm8=
X-Received: by 2002:a05:622a:424b:b0:50b:4ec8:9e66 with SMTP id d75a77b69052e-50b80cf1693mr79554071cf.16.1774478494542;
        Wed, 25 Mar 2026 15:41:34 -0700 (PDT)
X-Received: by 2002:a05:622a:424b:b0:50b:4ec8:9e66 with SMTP id d75a77b69052e-50b80cf1693mr79553741cf.16.1774478494141;
        Wed, 25 Mar 2026 15:41:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2a064534dsm171727e87.18.2026.03.25.15.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 15:41:31 -0700 (PDT)
Date: Thu, 26 Mar 2026 00:41:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Biswapriyo Nath <nathbappai@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 6/7] arm64: dts: qcom: sm6125: Use 64 bit addressing
Message-ID: <yfm36fgq3muz6cw2bizgg3h7bejq2tj7sxjeorhoi7tafbnnjl@qeipinzvbpkv>
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
 <20260325-ginkgo-add-usb-ir-vib-v1-6-446c6e865ad6@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-6-446c6e865ad6@gmail.com>
X-Proofpoint-ORIG-GUID: 08mPkFUMGqAM6hacnoMpHCvRneRR742d
X-Proofpoint-GUID: 08mPkFUMGqAM6hacnoMpHCvRneRR742d
X-Authority-Analysis: v=2.4 cv=Q73fIo2a c=1 sm=1 tr=0 ts=69c4649f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8 a=3mFuQuvshfmmPt20Ni8A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDE2OCBTYWx0ZWRfXx18M54Bu15yw
 ZT2X6Gntm0PptP1xD9f7H9kinDsd84ubaYsyr5yQ3aqW8AcssRQklL+OkSnAhmQkZf4CNhNNN0c
 wEW/LJ3btiRbVfV7rFNfY89m9p+6NkzqpQUEVoLqcwioOyGBKChHkSGgZTHad63C/Cyp82RSdJb
 oKMF6mfqKKNpKXNrSl8uGV95h6ja0Z6Y1hmQr5hlf8AeA4zaCbePGScty0Q7QuFTMQ/0M8kX7q5
 ZJJeHvaMN3s0jz47docvaKG9JQayRnpd8PnmIl27/PxK8RoiraKod7ITY40aKnKQ8zVaJC4Xqo7
 JhWo2s7cHy+EuD3F87NhrfSTP4qAgP5lzPsLbfIm+j8huEHESvsgoTqN13qmilWJ7P9eAiLWC7K
 9++XQ7q1k9kaoIEqcZKfpgCmfNXwOX3jOiwOUhVWYKxTkoFBq5KjfUqRLMpmUD9mTgwEu6qR2zG
 nE9MJE5YeSqOgoaA/VA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_06,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250168

On Wed, Mar 25, 2026 at 06:07:29PM +0000, Biswapriyo Nath wrote:
> SM6125's SMMU uses 36bit VAs, which is a good indicator that we
> should increase (dma-)ranges - and by extension #address- and
>  #size-cells to prevent things from getting lost in translation
> (both literally and figuratively). Do so.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202603141433.MDqfoVHn-lkp@intel.com/

Missing Fixes, cc:stable. Also please pull to the first place in the
series.

> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6125.dtsi | 153 ++++++++++++++++++-----------------
>  1 file changed, 78 insertions(+), 75 deletions(-)
> 

-- 
With best wishes
Dmitry
