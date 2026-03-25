Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797343A3808
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 10:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774435185; cv=none; b=G7jj94hAESUI1Ge8z7J9U70Zcus4BhIOdu2uBpDpBT+ZyWoIwFxYlpdj1xcRaVZLwUWSGL2VDOKdRVlKrwnCN/L4935uJt86DDExQij1R57ZeiCMzNqvM5D8/oX9JcjU4SWbVRyyNlTFt3W8nmlxZl2a4AuGUJC4xRdZbMRXM9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774435185; c=relaxed/simple;
	bh=HHgwGV5wzWeBgJq5Ox21ZftHY4R0wUkhdFxYlD7j5qQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HVUOACHlQTR1qPKpGwQuOfYsWrcsgbLH3JqZ2qc9Q/2ogCwKUfQ9TO+XFl6q7AmcRqLVYrdzXMg7aNGDRhCHRFdEHYrocA9ZwVT40hhMy2K765EnGMQc6qiLtghjvfeitN6dSfrlxp9HNzqvKVxIPETWtloA4AkdhPu6TGFQvDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U1TqGJDM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TFKQvwei; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U1TqGJDM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TFKQvwei"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PA4Drq2931328
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 10:39:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CgdJZ/1AncXD10N0VhV263/E
	ba9KRfQGDrqqpEEpQLc=; b=U1TqGJDMlszlY1OZkbpxFqYDz1/XY4xuf9p3PIsO
	MIHrZZud5MzYBMQevFX8dh5AvaXE4BQB7Bp3KKnlMzv5y7s9nhOai98pNWPgBjuF
	Mv5Lh1MWOmhWdEDj60X49bi9w0NPbufmd1YqOUrW55KpHVaNnVkydXuB/hLi4Fn1
	JBsj80KMZkgksYlKcnPAscw7WqHFLwej5TCVbGMMMdPkRnjGBHM+siQpcM1oqgqr
	LGg9U+6xmyicRaVyVcKX8AVsA9XPtc1K3Y34f6C0fO1azMHD2JqqEqvLgUc+Bbfq
	Ar0AGScnVx5QkgTgOQ3blTYMbqFibB9G7suk7wG8zNyjPQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4dmpr4ny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 10:39:43 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5090bc4823cso28797241cf.3
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 03:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774435183; x=1775039983; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CgdJZ/1AncXD10N0VhV263/Eba9KRfQGDrqqpEEpQLc=;
        b=TFKQvweiiDcNYggYYIigR5tNRDFmAWssA+Ftidfrf6T5Zv+i/i7QsV1/BURO1xZMP4
         zHcYsslWwtF934pgF8OvI93ytbPXck4UxIQNfmVtjSNKZna++rExi3Q7BzY7JFebYCRK
         XO43eYKtPQ7IRfsqjywx0L0XIl9kH98ydu4wrij/kSGMUmdwQDl/9cc1hToemRxJV0lO
         6Vfv3N1NRW0cEkzFVSjEkK1psM/F19hM6NNevWLUWYzKnix/L4JqXiWsCXsGVk68OZ3a
         7HUBwGJUHrC8bucjH4XT9fWbnJxzN3D9HGCadaXwgNtlWiNRcAgc0GTIFm2+OMQHUMt5
         UzpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774435183; x=1775039983;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CgdJZ/1AncXD10N0VhV263/Eba9KRfQGDrqqpEEpQLc=;
        b=ejHjsncmGIU0aH0nlOV16oIX8qL5jdMzHIKRfS0msiymQsRn1IfDQwvWGSHq1Xa3+9
         7wN/3/Dbz3qYkd5EeUhSPPB9NQo7ivJ26qzmo5AqhFxfez0eESMrj1vk7xaUkwt/4xa7
         gT9y/eMBpEZeRh5WXZNjQzSl7iqB9sE4ncb6lYNPF4HP1eJIIAbtPS7KYifz7xyGcV9+
         YnSNTJzJeNToFyE7uZZjQsKoCKBZyeJucABTkzwEI2HWSpGAI5aAu89a4CdBLMhRd/uY
         jf3jxdOA2KylHvPzpYUgMJhTqkfXQm9CKH/Iptt6C5p9tiH2raUdHsYFQD0teTOYbq3p
         10FA==
X-Forwarded-Encrypted: i=1; AJvYcCU/krXbsxEnGteRT6EgTUiCVCHgst4bdvuIT5BlDN8g77B+aG/Q5undT+14Hcf1DQJoQa2TeiJXC3Uw@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8Z6C6BzvzkpQ8vhVWgtE5F4jcFpfOHnumtOefRA+CviyTzvJM
	3o/bq6NcsP33tN5RHbEuZYGyCHVZ0rxGmnV5LIALknbGMbdlFRfh7fZaO4iipfRrpgb2dOmhcAo
	zLzSTop47g+bN1KILpOT70PFlqNUwVbTYYnpV+eWJ4dvGtBSXHeDnMX7KztsZfsl0
X-Gm-Gg: ATEYQzzxNUfMZTyl/U6R9Nsz3U4WbF1KwIA9LdhFAkwCMj5898gBu4TkzPIX6JigzSD
	VDCLZmm8OU5rWddcKIvplpks12HHKhDF2DOyShirwU4eKxeUo5RX4X609RNqMZkFTugBvVvc7x3
	5OGseAC9IvXVEXp9iIaUjfcfdwJw/9ehsCYnZyf9mZFVFvWIiouaGdv5CKfVxr00aIiMScRVOeV
	T8zat1iU93xry5QAIhiK3W6Qz2lUhH4t3zR1D/4WcnJMoILLT9ZWPLaWlipOtT+4EpyzL8rAefv
	sfR2zUITLAtYLRxZMf2pT+9Ljl4nBUPQEA5AwbrfgXT3FT+VpjUmRC2xVodnF8QXV9pusp4sc6d
	GVCQUhfQDT8xpixMr/w1XoxDqDOnQ82uJZsPxTfVPCXvyhG7YI2DJ6ALmUbQytmGjmfGsAsDgrT
	FEkUocYN2eD1Axw09hsDpygopz//8JURX2IfY=
X-Received: by 2002:a05:622a:11d2:b0:50b:3443:e216 with SMTP id d75a77b69052e-50b80e8ce90mr40449121cf.66.1774435182541;
        Wed, 25 Mar 2026 03:39:42 -0700 (PDT)
X-Received: by 2002:a05:622a:11d2:b0:50b:3443:e216 with SMTP id d75a77b69052e-50b80e8ce90mr40448821cf.66.1774435182071;
        Wed, 25 Mar 2026 03:39:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf9aa7cd0sm36779971fa.32.2026.03.25.03.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 03:39:40 -0700 (PDT)
Date: Wed, 25 Mar 2026 12:39:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: qcom: drop apq8084 support
Message-ID: <tv5jkfbfpz4bmabrec3dtotx2hxueaexvgqjnwvyheundy5jui@mgsbwckmpb6t>
References: <20260325-drop-8084-dt-v1-1-a0255a404355@oss.qualcomm.com>
 <fe12ccfa-d201-4740-a317-e07353a96b1c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe12ccfa-d201-4740-a317-e07353a96b1c@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA3NSBTYWx0ZWRfX/SnS5l86JSpX
 nN5linKSlcu2aarMmi6KdGWRoGVxdzJNamIY7rZChs9yZegzDF0Zs0mOHEoTM2jYdcB4NFPgWXz
 /Id4g/U7UxGQJA4LcvSneYbOj0XYZUhn2yTO3hgXlD8YU8CUVe0ZZlbHPFtUjzv+JXB2CcVI8iH
 kvVi+frVqy81PBGEk2op8AFnzP4J9rrFNVkpqJldjgEBhtx1Mh32uNEZDwThRxye7VGZH3vBUoR
 BeuljgooC3lVW6jLR+3uMJEhRv303pL6wgc3nYJxSjutsMdJXv+cv2LKUYgYEYC7KBP5+DSQUY0
 MQpv3J6sV8b+sC+19LSShbOeUF/SyESxjmI1m5RvOCS9Rb2t0nlcm+ri0BmQil2Y4oTuZcN26Mr
 jzK+zL8WKchytnqvLxwPBGh6dPDQscCCcWIveNfa9SrYnV45AAsUs16OPyWZl1MWaRSQoe5SFbv
 ya1+xCt/GZwwGuac6Mg==
X-Proofpoint-GUID: 2Bo3ubXOUiHL_hNg6cCzIwocI22wvgcB
X-Proofpoint-ORIG-GUID: 2Bo3ubXOUiHL_hNg6cCzIwocI22wvgcB
X-Authority-Analysis: v=2.4 cv=O7w0fR9W c=1 sm=1 tr=0 ts=69c3bb6f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=Gbw9aFdXAAAA:8
 a=EUspDBNiAAAA:8 a=0lshrEPJcMAk2WublLgA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250075

On Wed, Mar 25, 2026 at 11:09:24AM +0100, Konrad Dybcio wrote:
> On 3/25/26 2:45 AM, Dmitry Baryshkov wrote:
> > APQ8084 is one of the platforms which gained very little interest
> > upstream. It doesn't look like the there was any interest in these
> > devices since December 2019. Two devices supported upstream have very
> > minumal DT files. Start forgetting about the platform by
> > removing DT files.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> > ... and start dropping APQ8084-related drivers in +1 or +2 releases, if
> > nobody objects.
> > ---
> 
> +Some pmOS folks - if there's any community interest, please encourage
> them to contribute sooner rather than later..
> 
> https://wiki.postmarketos.org/wiki/Qualcomm_Snapdragon_805_(APQ8084)
> 
> doesn't give much hope though
> 
> 
> Too bad - this was a really technically interesting platform, loaded
> with all the features you could dream of in 2013!

If I see an IFC6540, I'll buy you one ;-)

-- 
With best wishes
Dmitry
