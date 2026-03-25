Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18955383C89
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 22:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774478574; cv=none; b=YkCCvYL5jHOXEyNgDQ3wyPEFSWKeDz7182pfLS5lRZg6eP63wGCzIvGIJ9qRpry2TnZBT/S4qhohBC2FxBnFwedGsNq9qqQOSQg6zF7a9cq5TfBJ4VvEeq+HrxBGwaR0ctiOk+xflKeuRQz5/Q/rtS60MYaTaqivUOWa1VYPvtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774478574; c=relaxed/simple;
	bh=2Zv6b2uFyPwk92Vrj2b4m4RCN3u6OwSUTKvaWzzk6gk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RqsSAIioWkRkz8hE0vFTuC5jU5jX15nCe2EOC2H4Nn+kjLHhpdQcgNMa11JoKdmnfgFvIhRQ05jgWDY0N5pBP266fpHWw0HP1A+ZeZhFacnzg/fbatURXLfps5cBgSc/ioNLHju9oBho1a/btXQTLySguN+dwaR0sT87B6fud5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LFJVtxNn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JMed/yKH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LFJVtxNn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JMed/yKH"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PFHHQQ779740
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 22:42:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mcP+C5mmyp3mXG+oZ5U13jAT
	3Ccsoj1xoxf8jggQrtw=; b=LFJVtxNnemQhCUukDOSuy2mALYTo/ynQnUq7jyD4
	/UsDzSEA2cJZRsRRPBGi1l6t0Bx3PfTvQFZDU2q164M+PA5JDOEU9heY9HTAHVz9
	uu7/MBhUH9YvPiF2by5+1iZE3GvYyzD0OfMUunRdbs4jrMUIY4g6e1TJQSW1N5f5
	JTxAQWaOKl/5vM5TxWQrhZj8lNNcsBNwrAaWautqrzSv8/EcibgyGtPfkrFE/rKL
	NbPF9DKdjrjwrs27TIo9EBd9Jra2ekhQRc6c6G7VT9Aa9fRoarFtaIKFbT0/03Dz
	Y7DLikqUWHwPk8lQsz7SdU3QufPJmHOK9w95IgeTRPmHdg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4cvp2tjv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 22:42:52 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-509044f54aaso13110321cf.1
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 15:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774478572; x=1775083372; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mcP+C5mmyp3mXG+oZ5U13jAT3Ccsoj1xoxf8jggQrtw=;
        b=JMed/yKHPfyry4psK2JMUQGFuGEPyTQyLzfoVH5X+JTIazGkC/0Ph2rNhhrYrzjXwB
         wI5+2ki2yYxuQDsyZCk00F8kPrr29LN8kAX5gmp+0OgCh+HxpjyXIrlyYco58KWz93hn
         gTlqjYQopthvMcL7GYwBtFuF5ScoQpR5NJZkrxBFpaH+slgnt7cxCDcKyFvboNEeeuls
         i9JsW5vdFv987rDYUsmaiPpMuR3vcSAmyVtAbTsXuF+BGaSTL/pXZ9tsAR5/2HOnBr0/
         Gs2/FZJjkx5JJOIGlDo9JtNFV6rxF/ITyX7807dRWbyisw9pz1P0cNXq7TRKX82Gb2rL
         nQ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774478572; x=1775083372;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mcP+C5mmyp3mXG+oZ5U13jAT3Ccsoj1xoxf8jggQrtw=;
        b=LQQ4j+ilIz02GLqwjuTpx79iUinVCSMtgHjI1DzOru4U6di3ass6Hq4+SqppvVlEdp
         koAvyX8Lk1TVpZXul8v+c6+mG3Ey0qi2Y9s+1auKCQR/Ijm/JCK1GifP5QPSEwGRiYal
         LYvDV8OYKNNwfiQfIl5zqg8ghbm4lN6HVo6Mj3kTEqcFjb2ELc8RKup2Y0WEIiUOesOh
         TKnuvd29yGZGV1vnTO/wTM/VA61VWsEVoqV9vbfKdfRmoO3IUNGvsyF8Yw2EtyccPV3K
         D38WtwfrrouDapwqtSbAj1MbwfXhxXWiJwrRDXyhq1qRcf2PWrfYGeQ7eHt9CgqAaCcy
         6Gmw==
X-Forwarded-Encrypted: i=1; AJvYcCVuRSyQK63BmnAvmwNeDIG4OUkzl0aA9h6gEJGjnVIchCcJTVBThmuFfG1AiMb1aCEU8AWqYJvIxv1G@vger.kernel.org
X-Gm-Message-State: AOJu0YwCSuPjK7Go4ee8KvqZImX718TekypyYXjaI4Gge3EcvKZ4FSXN
	7jAeO0lmirsBKT41YKUUb5PvIn+TzK7SyIYLfYc5Pvf8neY33L4/7Vb6ctM/szi6YITXDV7bpB7
	MGT4v65JY36usct+c1PlILdthDjSZITUpjRYPlKWEhG4yP+liP3XDM5OH3s2Rtes0
X-Gm-Gg: ATEYQzyuXAxWSlQafIGM2q7mxPpB4SAxf9eflZ0DYH6w989hK3d33yWsa/xxKy4y7vk
	nzDXWYqRE4ydKV/OwB5eUU6iPgVi8IgtH8DYLQ2LUMU5jZK+gxpZYKxeuDyIhHHKtSd3iSfZbue
	0xzKoDw/55TB4WFDv/aIo3Dkb3QdAegm5+NpZzkyC3Bc86ApZvQt0nSm1c1XQEoM1oeJDETSSQv
	tqyHYeyvHvi+3AWzXjKCKEu0sYB4qx84t7b4mZiLSxnzho+q/xDPxj8hl3Jv9m1T4FOXiRO7shq
	U+D7x3TJMMQ6kgxwfyvODGyTkwqlxHymueuY0KR3+R0KDZfOrzRv29cOyAI0mGQe8JnE9vmESbd
	YYrMPlnD4J6zSlRrhl9FS8wPRv5MPK9UgcFTyJM9u5ABKF4o7Z6u00A0WyDq+w42bIp/6tZ8ngT
	DdTuz3XfQexk+UKcOIRfW8yGK0u5Oxzr9pagc=
X-Received: by 2002:a05:622a:15cc:b0:50b:3be7:b16 with SMTP id d75a77b69052e-50b80e4b3a4mr74064811cf.37.1774478571616;
        Wed, 25 Mar 2026 15:42:51 -0700 (PDT)
X-Received: by 2002:a05:622a:15cc:b0:50b:3be7:b16 with SMTP id d75a77b69052e-50b80e4b3a4mr74064551cf.37.1774478571250;
        Wed, 25 Mar 2026 15:42:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2a069903bsm165984e87.76.2026.03.25.15.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 15:42:49 -0700 (PDT)
Date: Thu, 26 Mar 2026 00:42:46 +0200
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
Subject: Re: [PATCH 7/7] dt-bindings: clock: qcom, dispcc-sm6125: Add
 #reset-cells property
Message-ID: <mc7myusw7ehmcgarvndoylyhqdplgr37w7b4nttj4fn4ygw667@52nfrzyejqwl>
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
 <20260325-ginkgo-add-usb-ir-vib-v1-7-446c6e865ad6@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-7-446c6e865ad6@gmail.com>
X-Proofpoint-ORIG-GUID: vEUULPJ1BtNDrsqqjhqW-Sy4RaSNmceO
X-Proofpoint-GUID: vEUULPJ1BtNDrsqqjhqW-Sy4RaSNmceO
X-Authority-Analysis: v=2.4 cv=Q73fIo2a c=1 sm=1 tr=0 ts=69c464ec cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8 a=TIRtq7bqiOsBIkxYvl4A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDE2OCBTYWx0ZWRfX+ZeX8T7Qf9uO
 gcOniEnAgB39CZdQUYab7ZMPGipv2BM7L+8ijt8g79LaPcjrzvWEsh+yYv0Oqm9GSuu6Lr0s4vG
 eXwcfbNLkbZSraDEGxOs11IWIwJjfhg3TiliQ3Yi2476UI2UnX/ICq0XIbwS7sR2NFQq4m23g3H
 sToZMFNhQMzGOKy4D4BF26AoXnoSNw+/2o/K7fkVDkwlps8yRQ33/p64+aqboAeSFmtUQZrEkjj
 psj7efvs9utsXqZfxpPNDg5Tf6P5SFk7JXM5S0iTw1Pl0xUyXFOopjWisfRuGmMVvQ/bQgL+bUm
 URHJqexfrm/CzCacdvrfSZah1XDyEOFavGILufEMsOD9DTehgh8g5QqQbiaos5PQ+xmqQiz5eHY
 MOk3W0GHTIt5/OKr5XWhD8BBPYphH2d696AdIj88j2Gj8M79H6dt38WgBSjD1aApId5W1f05ixs
 yUvysTmo0s2N7FEYA3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_06,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250168

On Wed, Mar 25, 2026 at 06:07:30PM +0000, Biswapriyo Nath wrote:
> The '#reset-cells' property is permitted for the SM6125 SoC clock
> controllers, but not listed as a valid property.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202603150629.GYoouFwZ-lkp@intel.com/

Fixes?

> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

-- 
With best wishes
Dmitry
