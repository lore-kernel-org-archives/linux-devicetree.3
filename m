Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535FC429CDC
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 12:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786453042; cv=none; b=MBj6vzhkqnEj3isIuW3DBc2utwgsoGHCpxKrSdXSorwmTh2FzM9ZrUe+w6hD9wzXxq5wTqgOpcwN9yLF4yl6goLugBk+afw7vz9vTfMPCIdPnXVmO8nRoW2u0x4/KbOIexkhzhAi9VQKDSCg/Dv3PLZaZ04TM3AnXsMACW2cxOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786453042; c=relaxed/simple;
	bh=YhjbS+rkqluLXsQcr/VIExXq5bsjkwKOzy7xfzYo/8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KYDgbn08u9aL5lCpRTLRigfwDEZEe9/vYOpY1w4P/nbM3u6JOckjJTaMaOXosicZB0czssss03lnffy/2CMrr0YMEuGzQQkzRdMndQqn/juY0ppiIcMsy8eli4BOLzIFu4pDlHvP6his+/I8JWKS1vW7FBwwkz/+qPQeVRI/+sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZVTg82nD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W76qaS/D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZVTg82nD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W76qaS/D"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BCRF5H939633
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 12:57:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6eh3Cvdh9qMOA/Y9U3ygnzv2
	xsQ7ATnC69ecxt4Avyc=; b=ZVTg82nDkf/9W43C6Tb9Hl6TRyteE6fJvEODFIbs
	Xlm7kVctgekBkFLp7sK02W0qOcJINdvi7nZtuq5foUrcS88i56bn2YE6LWMrmpvq
	27HFRQsiBp4x/2HTRGJgAn5K3HfwPfeHK+Q0UV/Sd0156b+TelXBuKJdXJ8nYVs7
	IWdGB4iul0MO6NMGTuVMZXS5XnjhC5Bu6StfQPGWyi61BgL7qH68kaAPF7QPI2v3
	QfQOA4OBMzlxSO1k2QgNsSviO0/M8JKkHskpsuVvd/m7vSwRNcojGMoe6FipUcbD
	EyszTNbo1+vha+N/EiELceh6bSxsvcVlxehCUymCzOus0Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjyfv25y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 12:57:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bf321d786so38140831cf.1
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 05:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786453039; x=1787057839; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6eh3Cvdh9qMOA/Y9U3ygnzv2xsQ7ATnC69ecxt4Avyc=;
        b=W76qaS/DnGBSXEnxBuf0G2jgAF6S8+qHjDUKQuBuzciMJz0lytljeqSqTOgItE+4hk
         a0MRRr+o4OyKvz/WsKK4tWxwIm4hJCyIubaOwjiIsPu7Vq2/cTiosywJoD87Z8Wsw9Ry
         8q/nPN15duKxClW/VQJWJ48OrIi+RfmY0sp2RDU0mcOVSMBGiz6Nz+FHY7vq+qhd8SUO
         S465GYXRYBfMYkyiTmupBnsoDN5lNM+Zy7s8b27yxaZA2LarvzG2mm3bHWw04TqHOURs
         qRMfItsk/SsosXbjhtIkhtLnqUTPfyrB7BOu9eGrKbyFKqijFFmYbuR6TQ7Lybf8FK9Y
         moGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786453039; x=1787057839;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6eh3Cvdh9qMOA/Y9U3ygnzv2xsQ7ATnC69ecxt4Avyc=;
        b=LDW/CgofqP8Ry0VL6eFGiRlcKkYuRk6FH0QEKfnVAENNQvq0/EwRNZzZ+FfBVFqRQy
         Gq4hVa9Fv1P909d7yYkP/vEnsV1TKmp3Yi+WsvXYOFQoPoBaNFQmQ8S26m3Rjut7waNN
         YQgTjUlIWDnQyxGEvtpQpwXlfX/jthT1vhhgCXrhCGy4z7t01KyQcxFs4muWkpdRfhkZ
         TY+i+z+84jCobyOtKlZgM3BBnG7SrXXwqafgZVABWP0+B7gTczBAH/14WgTxSukR5g6V
         c/rmF5jGLtMUZ1QhJiSG+v5JvR2rZnsntyh4vBA+4xYBTtBLJ25PShmEEq2gLH61MIx1
         CQqA==
X-Forwarded-Encrypted: i=1; AHgh+Ro45+kSGowcAQp6pcTsuLYSdQcue9rI6gvtnKfbTbaVRZJ0yTPjmOE2n9CmMfET2hS9a479lTeIUdH6@vger.kernel.org
X-Gm-Message-State: AOJu0YwOojD1v3R9fFuEiD8tEnzxBhPzlwk0gxRhC47xyf7+H3jntzB+
	eWz7myTfqORGWmNqS0PQOrJ9bniqL0UpMnF9Pdz98xD4zQ0WQOF6bH9RNucoIm7Kh9bVf24cQSh
	isOiL8xREKJyHkuKMnXh5LfNBcZLMuN2PgeuVBAm9+LOI9OJ5TZoaQiymaIvIn/38
X-Gm-Gg: AR+sD13sm0TPtlB/Xhw5X3V3kEoFN+/nLI4FySem0CJFNQkecNb4ATJMNMw1BrG8Oz9
	yDWYHtUL5JELL0bzi3hTtz7xcRILsRkT0R723Zs6ZQZlNmZbyzm01kDVdEOSmcXQ8gwuN1ryB8Z
	7uRCsd/2I0jX5e43XfH6v2EEqDPoK3j+SxByYtzmjYjVFLOw7F4ni5dQf0odm1x8CceJM9VHTqH
	n/lcBa5dPnLh79SvlRJIfu6E6c9mdZgNKH921mSKgXZcCqECRgJlzm4HwAR084IJ6HybDS0HT6B
	1zGqPAN5ObZv2GKxWuNfGNnx6oL10AkAKAy/eD5Y8PWuBruj+A8nvBhDeVTDxi5f+y1JRSuydS9
	gVc+BfHkRQwZP9d2NdpmvIeIBnSjYFZFbjGiN/xkOKRMz2eufr3RE9+kZX99GjmP9dsIiV/EJ9T
	OscWwbAlbM8Uo+Fg==
X-Received: by 2002:a05:622a:2612:b0:528:38b1:b54c with SMTP id d75a77b69052e-52d584d42f3mr23286051cf.2.1786453039467;
        Tue, 11 Aug 2026 05:57:19 -0700 (PDT)
X-Received: by 2002:a05:622a:2612:b0:528:38b1:b54c with SMTP id d75a77b69052e-52d584d42f3mr23285551cf.2.1786453038956;
        Tue, 11 Aug 2026 05:57:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b448736625sm258787e87.78.2026.08.11.05.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 05:57:17 -0700 (PDT)
Date: Tue, 11 Aug 2026 15:57:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, stable@vger.kernel.org,
        Daniel J Blueman <daniel@quora.org>
Subject: Re: [PATCH v2 01/12] dt-bindings: media: qcom,venus: Add context
 bank subnodes to common schema
Message-ID: <bycv2ktnaeyy54z33ehaqtghh4xze2l7fgsth3lldzsy4jxqat@ywqz5kadz3ie>
References: <8130900b-c9f2-4f5a-80f1-1e8567ee1b72@oss.qualcomm.com>
 <f252d83f-e0e7-4061-8da8-d2650f1beadf@kernel.org>
 <ea0f1777-4615-415c-86d2-2a792ea42b3e@linaro.org>
 <41163185-09e8-47b5-9ece-c6503cb48920@kernel.org>
 <72b267c5-6490-453a-9900-b196d1cfc5f8@linaro.org>
 <2tWmEJ8s0nm8efbgvq24Zwo1vkuH4Na_gC6stCr9_O1A9k9JcA2-TFN5qziPoORYrCKyDgjscvGyO64HI6qVqQ==@protonmail.internalid>
 <72b4edc0-dc80-484d-a2b0-88ea11ae001e@kernel.org>
 <995779b4-925a-48a1-9288-930e0a10b7c5@kernel.org>
 <nht5phhqatbc35rh4l4r5lbf5bytgb2zmesv433zjscs5ye7rs@6y4bczl23nao>
 <353172fa-8acf-4055-a777-021177761fcc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <353172fa-8acf-4055-a777-021177761fcc@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: m0kd8FcjEnU1pa-l7NhiM1gbIW46Ppe0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDEwOCBTYWx0ZWRfXwHBGMwd2KbOJ
 xh9+KEWD2LE/IsEkAH4A4tAfk1uWYvDsw39Mnz7GjJtKWAoTyfcViWtjEkP7oNfUyy74s2v85K4
 NS1EVhc7ZShHzrRLT0cQs4o//PW7dH0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDEwOCBTYWx0ZWRfX7Iviei58XEeM
 LhZ0m5c5gxvOK06QLksprJEOdOMdQfu+skwYkoqPbVnZQs3PzN/1X8OKKgcmTYzA+0HdpGsrSaG
 1cMvXBv7xdv1wmkZVvrdeUwVaBiI8EHCRVj+n1m58ChPUQzoLYBX9WWzIiJFjLINqjeSAC7NNs1
 vwo7vS8WtzPllm0VCtK3wx3Ksw7UAfybrbXV7w3sKbyqFT9NNoi/ZBmyPXH2ean1Ulhk7Y9/Ari
 cQ1wVHKS1XoiBA9fBdAizkWLjCiBBYOK5wNXnOTChK1XxZLRIriQdr7CkytOQjes8yUoquKM2SA
 g7BR5xxG8c+HgH0Pt2VW3ZA0eYpUTtHPRC5WgaG8Grzo+nKFDr4te3I2WDYQLxCGkKVyi/sgphV
 z5xKsSigFUC/IrWnH9ECFQnd9VWF9S3xupYQ0U6BQCWQ03hD77xVhkPo+uu5Rwy4c1EKEiIFO5/
 cCq+cln4IcR8u4FTMMQ==
X-Proofpoint-GUID: m0kd8FcjEnU1pa-l7NhiM1gbIW46Ppe0
X-Authority-Analysis: v=2.4 cv=Zd4t8MVA c=1 sm=1 tr=0 ts=6a7b1c30 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=l3kWL9sSGVb21S1R9WEA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110108

On Thu, Aug 06, 2026 at 05:50:36PM +0530, Vikash Garodia wrote:
> 
> On 8/6/2026 4:44 PM, Dmitry Baryshkov wrote:
> > On Thu, Aug 06, 2026 at 11:50:01AM +0100, Bryan O'Donoghue wrote:
> > > On 06/08/2026 11:32, Krzysztof Kozlowski wrote:
> > > > > Yes -master.
> > > > > 
> > > > > My issue is how long this will take. Several kernel cycles and the
> > > > > debate is ongoing.
> > > > > 
> > > > > Daneil's fix has not been applied which means the replicable system bug
> > > > > is out there in the wild, not addressed.
> > > > > 
> > > > > Daniel's fix could have been applied and rolled out to all users in
> > > > > mainline and consequently stable.
> > > > > 
> > > > > Instead another architectural level fix is still under discussion, which
> > > > > is of no value to end users whose systems can reset in the meantime.
> > > > > 
> > > > > Its just not responsible behaviour. So I feel both of these drivers need
> > > > > to be marked as BROKEN unless/until a fix lands.
> > > > > 
> > > > > I'm hoping the vidc team will come up with something else.
> > > > I did not object taking a known fix for the problem for the mainline
> > > > kernel, regardless if the fix is optimal or not. I only objected the
> > > > reason of taking patches because of something in stable kernels or
> > > > making backports easier or whatever other semi-expressed reason, which
> > > > is not the mainline-kernel reason.
> > > > 
> > > > Best regards,
> > > > Krzysztof
> > > 
> > > I'm all in favour of rolling out Daniel's fix.
> > 
> > The biggest problem with it is that it looks like a hotfix or a hack
> > rather than a proper description / solution. From this PoV we will land
> > the fixes for all the boards in mainline and then fix the same issue
> > _again_.
> 
> I would call it as un-optimal than a hack, and certainly i can say it would
> *not* have to be patched again. Its simple enough that it applies one
> reserve region to all, instead of applying it selectively to specific
> stream.

Exactly. Which means that it doesn't describe the hardware correctly.
Which means that it is a band-aid, a hack or something similar rather
than being a proper patch.

-- 
With best wishes
Dmitry
