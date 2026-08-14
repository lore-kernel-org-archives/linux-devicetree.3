Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC56D40F8D0
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 07:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786693555; cv=none; b=PwPjg2Mqu2cBMguoMTEqWiKKibieYfOjkDHdweo9UDKPMDvJGEyDGIO61oOF8VRRczTPkL0WFb1JIXgQbZA7zAuEQLRODoo9FL35HtstYeQCe0B9qieIS/gHhSjYxu5S9ifUf9GhvmA6yu0dMPGPxauAXvxotFSZp3RvpKVV7vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786693555; c=relaxed/simple;
	bh=odhvjEz0uGc5n8RkpwlKDWDtDSKuyDnnEDBwtJ8W3tI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nNDyEJVTPTg5uK8yeeKhUMTNrj+aAPQnTTRgWKSqby9pTJZ/js5xFp0cSSYd8jmvvDnO2Mk+0kFl/Oa3nUlsxOU94RTWUYR8k6fTk5lJegkV1XU9ugvlR8D/3ceQ3BB2EbrZPE5eOdcy0zfkyLsrkjZGp4+gVlpmwSoLEWSJEoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RInTndO5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ewQ7uzCh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RInTndO5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ewQ7uzCh"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E7fRcb1079117
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 07:45:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7kZ2avGnMlg8Z6PBbfqxwFl8yWl21AGMezmqeMHyqZM=; b=RInTndO5652zutsi
	uL6WzNzZ57vg6GtW6Jv1ldEVYC0s1++YbS3JcVb/isfmlwL2wDwoYrTqI8exRUre
	ndB3EIH2wRm8i/SLNERLdHUONKioi0HEThYcZQue8Vtd81P1ITp9sgnRu7NFP6Ga
	jJMHdvVJrf/ZLVzil0LBw4Nveu81RBikaoC4F2mLrO+5mvnISHXicU4fye2VeADp
	r9qRiQMHBb5vGWn9XbiJQ5Rwowtd509/2QvOUoNVzgaKx4OCBHj0DmPzcKFAK55s
	1D2GtW3zhoGkYqvLF5YHWdsFZANMWpikDwlUUK8IQDEIea91s2nsH+ZFb9PM8qL1
	N7kf3w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1xexg3nh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 07:45:46 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38fa7b09921so1061439a91.1
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 00:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786693546; x=1787298346; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7kZ2avGnMlg8Z6PBbfqxwFl8yWl21AGMezmqeMHyqZM=;
        b=ewQ7uzCh9PseWeEnaMv80LcqVNy0NbamlsjzLOACaevLy5OQcNGGJwfFtmM9Ny2n84
         DRMNfU3ldVKjNH5Hzk0gi/pMCaDplxI/M0eZ0o96ICtZteJq6ZnIrdrO+8Sf+dQvsXrl
         JcdEpqqEMfPsrzru7666Leou9SXS8kqL+KAIK87sjXNOS38ftRawCRVjeJgedLquJIh8
         quMkAo6sQOf9mLR5fE2lPND9B6HmbECBINofTKIE6h92yCwNQJAWp2IUCcZO5P9F5hfx
         dZMnrRePsso0deY+domLYtVTe9w5Tn41AN4w/O6pmfSKr5I/iGrQhLJ9XeatL02QmY8E
         jfWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786693546; x=1787298346;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7kZ2avGnMlg8Z6PBbfqxwFl8yWl21AGMezmqeMHyqZM=;
        b=BU+S368P3Aw0VhusSyOh+tuBB9VsxJh7oyd+t2J/BT58ba9LugMh0GvXFvIdz+lLkq
         1Ma8dVitN079PK97slnV/NT79G5iFeE+cxo2L3bOaagbBFWLesC82mFsuYY9CWFKR7SW
         ItwZx2sh8/vWbYLLeJjTQbUlo6V27/5tLhUPMGmDd7Z9Je+mT+0pBv4ejz5Qh5t+Qb+c
         Ry4BXEF6BQVBbs6oqS55OM1z9EA2G7MV3uf5hXkm1fpJ/R8XzpC6INO/XnhcfLSA3HDR
         MfE2cdt7dZlcRZ08ydep8N+OU0WjILC7jSKPzxRyfcXBZPOUAq9fzFx5MdjKRkxWHQTc
         sw4g==
X-Forwarded-Encrypted: i=1; AHgh+RrtZ0IVYaSXnk9FfGjIQCdhYtFS86iWYuGo04+dvUszn7qAFB3h5LXg0fLVY6ZM4oyGmtTGazHpNbbS@vger.kernel.org
X-Gm-Message-State: AOJu0YwMDzHpXYjgLfOH56co56MXuIgYcadfWv7Xhd0SrNvf01pD7sTF
	JZct+h74qdmN5HDsXJXz6tulpNqPL9R/pdCUADD8g8GD1rFTDnIxHef3ht970n+HQmbniE7ige8
	LgaagoN1SyGZzYt321Kc0PeredMxicmMW/GVgpaX0swMCxbFL25WZf9h+SPXBmvle
X-Gm-Gg: AR+sD12mpJf+4PLCTNFz1Yms5y0YtaVfCh6m3kgDhTLBFEZ0gCR8eCk32NIvr4oweBc
	+QSvXMLyRCR/4hbwMo182J+TDLmic0CM6/sQftBMng3LLv+zl9hlwPA4oaUzmpLjMo/7ARApO/U
	UEQQmb6mmVXRkb/kYO26s3ZHnMV8LFzsXr9hjHNdc2ivZDDRALB1Ij4EJ7hokzTJaRaSMZtHMOw
	S+11BKU2ZTiPCJ3CIfVq5PCiG05ox7lXm87gD9Q9jgtfrsxUCjI98sPQL5W5qftkX5s880qGzQM
	ax+N5ZAUhBFeG2sdNxKT/xAa60lbPtYPY0sPFTaKrqspBa/gnMORmMxTjavyVqJDKuLtxLKj7gn
	PeZ1asaURsVK4zwNObmGr4EZgz9+wGd+cmPJZ8F3uuzn3rM1QtGOng8fyIroo+PF5Bb9zZ60eVh
	um1dcf6UxyRdZu/PVceL8=
X-Received: by 2002:a17:90b:268c:b0:38f:2168:b9cb with SMTP id 98e67ed59e1d1-3933b84be0cmr4470094a91.9.1786693545542;
        Fri, 14 Aug 2026 00:45:45 -0700 (PDT)
X-Received: by 2002:a17:90b:268c:b0:38f:2168:b9cb with SMTP id 98e67ed59e1d1-3933b84be0cmr4470024a91.9.1786693545103;
        Fri, 14 Aug 2026 00:45:45 -0700 (PDT)
Received: from [10.79.117.20] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3933b688035sm772468a91.3.2026.08.14.00.45.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 00:45:44 -0700 (PDT)
Message-ID: <3941f29d-3da7-4576-a852-9922b94007df@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 13:15:36 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/15] ARM: dts: qcom: Add initial device tree for Kuno
 SoC
To: Linus Walleij <linusw@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
 <20260809-kuno-soc-support-v1-15-5e0ede4a0c72@oss.qualcomm.com>
 <CAD++jL=M1E+Bvfe9tHw3FaSTFgR1Nfzyn==xoLETvARLZHPrMQ@mail.gmail.com>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <CAD++jL=M1E+Bvfe9tHw3FaSTFgR1Nfzyn==xoLETvARLZHPrMQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA1OSBTYWx0ZWRfX/af5fJ3HUei4
 wBfRwOTBm9WvTfMNqIfwiohgU3kJuBaZbB46xdjFdnWYI0E3NJmAOfA1yAGTnsR7Y/Yi3v6ZBNI
 s+FD8vfNS+oERq5IXb3x7HLNa3cxOlw=
X-Proofpoint-GUID: 5-hpKh0yFTeOeWI8nCOjKn5UNvAmfQ-_
X-Authority-Analysis: v=2.4 cv=eO4jSnp1 c=1 sm=1 tr=0 ts=6a7ec7aa cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=EUvog4zVDZIPAgcz-YkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA1OSBTYWx0ZWRfXzuB4wj/7mjXj
 6FaPnk8DnKt1kTVJQ+FWIW+TZgW/u5gjv0fMlOqmFL0mQg2CS8dm2UG8oZmzPR3CdCgwvexTyvR
 gmxL3CgRkVzsUAfzTufu0rlZy2u/VryBd18P0TAOiNEkqvaflae9Es+i0zEdomFhNpGIoITQTqN
 YmZaos0jf18Z1jAs/6CrHmLFGJCe1Q9STCQ2TpLnF+q/9k+llVeQiH408gyr1mTCPro/rftJjQk
 j5B2TXvMFt7bVOjxRyapNE3WFyCxz3t9CBjkLBlhJ5huUfFCVZYlT3TBB0OvoLd9wBAjOw9Q1Qj
 a2eMlEUXSfP4gZNKQ0PP9/3d0CaMg9MnsDqSTi0qDyVFLN4QeAa+dCYafLwdRjjSnKVo1ok9ah0
 eYAlV4yiA/XhMZJDhrjdmBjRJshzuAbwl2nqCd9WNi5wBjvCfZUnIqSYm1qhdFOefpjVlpl/S1o
 4qIstLoajTRjfakDLwg==
X-Proofpoint-ORIG-GUID: 5-hpKh0yFTeOeWI8nCOjKn5UNvAmfQ-_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140059


On 8/11/2026 1:33 AM, Linus Walleij wrote:
> Hi Hardeep,
>
> thanks for your patch!
>
> On Sun, Aug 9, 2026 at 9:29 AM Hardeep Sharma
> <hardeep.sharma@oss.qualcomm.com> wrote:
>
>> +       memory {
>> +               device_type = "memory";
>> +               reg = <0x0 0x0>;
>> +       };
> Since this is clearly intended to be filled in by the boot loader, then
> write that in a comment.
>
> Other than that is looks good to me!
>
> Yours,
> Linus Walleij

Thanks for review.

Done in v2 : 
https://lore.kernel.org/all/20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com/

Best Wishes
Hardeep Sharma

