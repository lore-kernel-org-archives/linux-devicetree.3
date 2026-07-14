Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7DE3C0A0A
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 12:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784031383; cv=none; b=cBZi5SpTAWFFhHx71H7+Pg+tnHvv8ZnY3+Q0qaQtSrhYrmWj4FuIoRF29Wbv2LNEJ6UKRB3MEG/8FrefnQ8jbjFRSl9t4/CS7Q7xy1C9zunIp3q7oU2IgjqfDPk2S9TcRR1RXCxAnfaEtBqRfoHRFnkZneWcSWfHKb0pfc0NxI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784031383; c=relaxed/simple;
	bh=cBkiKuV/tBtgvxHXjdq5Qq8BR4W6hZWhNad7hjmbIhM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nxkZoOiSGQHou8vT0R9/NhYW3VWdfguOnpmI5881f4rU7lA3wnR+wIUu+B0/GvnOx29DjJB96qezBKk6WkJaAfid27lvviPRKCVOWrnYXOFNMbJMRbiEPcNjtcCbWRys76PhkehH9y7Of/17mBJFvP+9uuRHbUiW4V3v5C8zGI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dbuyVAvY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=imDVR1bt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dbuyVAvY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="imDVR1bt"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EBOCX5356338
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 12:16:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vgjnANe3FHbYOYSktm9426t2
	tYNOf2YtqzbfrG0lk04=; b=dbuyVAvYr1VkUoSS0vBF5D8AZmf99jNtPiRS/SRd
	C6N/ZHFg1ndx1QHg150JcJnAtboDqFtPvvkbD4ru+EjElK6K8VPjoo7LqNRWUdCU
	49IHzQdbYm3hU85AFSgLYMqfP/R5jOQaEZVc9hNPwk1jfPs8kh5+T5S+x7CvSA5d
	jckmNK+qmOVijp1s+k13X5Jd916KBPQDF97LRSUQitnqUwFSUAx2kheE/00oKE43
	ZRV1WV9aNEeX+qjK0yTcEgULdyropBeYguQmxF+kda8hJWaOfOVO7HbAgMBfSgZv
	BnlXetgkD8eSCadPN1+y4qEwQd1CJV+cXF20UPkuA7ppYw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44j3nq6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 12:16:10 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cce14a21faso17814965ad.0
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 05:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784031370; x=1784636170; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vgjnANe3FHbYOYSktm9426t2tYNOf2YtqzbfrG0lk04=;
        b=imDVR1btkATLntC0gpccc/L0u23+tb6cXgUnPrXy6lA6W/CC1J00XI061y1LyFz4K5
         Sb9TicXHSrWXKpEeyi/konKeR3L29eQj7VcnKlsHnCbSJXNRovPW8pOkgyURXPsEwww2
         vCik19qUYL+rRH7uQSeiRBkjyWsSWgFq7+rBALNQ+HdFUUK7FcWFAmeQ7V5vFrjU+SxY
         NzM9RATo7AQJofVULJ1jt3R6vrcpYtBAKOEsGwl2v12Ax2La4GPeQ30gq+5UP7FwWd9k
         tndRuf6LiOGESNE21IlXQhb9wlAGRnm356kl/8lmu7ieG4hEmod8UfdeRPsn3msB90Wu
         e+og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784031370; x=1784636170;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vgjnANe3FHbYOYSktm9426t2tYNOf2YtqzbfrG0lk04=;
        b=fEww4iuqmiEUj2qFsJCSg5ADc14eMFa8yS2++3yULBFf/HJ+gXbnYNWfJxwHLmQLfH
         QqACZ3GIu7+YPXlPT1hwe8keN/FBFZa9vE3gprPB5gzqHAcrCccZ9D5qFvYeM+oJzsrD
         ryhQ7uyAwIzt5nhxZs1SrNYtAWs9ITGMqkPmQQInmxsXNEpMqLsKy/9Xa2tqVLfwt9I2
         Qfzh6pj9cdQ4+dKu7/rIZC6g5EYDbju11hyJsXnOYEsQqyMtrjyTi6ekeb2U6sQ6iurN
         QiLN/Zml5+t8L5fU71S1V2MGYlgFLN1WgNcQoFm3BIjYmbrnslLg1NYzFwcyByMdDPss
         i+wg==
X-Forwarded-Encrypted: i=1; AHgh+Rr11BMjHS8bHGx6wmVwl6uW/VShBMg5ox68PaAbWecBiSK7OvdmI92FO1I8Pym4Wbc9iWwi6Li7iK4z@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/VSmlusFNduTShU7X9WoHqCEFSweLlxGiJkSd95tKRoyge3nX
	MOq0j7cKi7vFeMmcjOfhRtjVWHcWzC8KFU/l52rGTFR/g0SNNIZ3EZBNBfOvTTMmqQufxspvkuS
	7lUIkGwxZ50C3lfSr4e4ch0SCyqYoCjiBxleczwJv23p+uwQ7tAiv8MWvjaglauJ0
X-Gm-Gg: AfdE7cnypKecDgz+EqsiYK0pzHj1PZE/mVQ0Y7dEwRG1kcIO7GeaRHvjt5KbqSVDbJ7
	+2bxj8fiCz6pb0yIeXFd0iJ6Qxt4Ss6SrWoGQEOKSaagyPPYv8enJ3m76la17xzLekxmexo0c+I
	KdOHDhpx4xSWaYUlxHVRARoXf5mrM9drMdPUSRmQCGF5QqVi0ly/PoXxSZeTiRAj2/nZRXqJ/12
	+Mq7RJErAo5siGHQ5MOeMW7CUrcuN9/owg1A3fk7rjwx3ul22/bv4mJlLKt/v8apN5Lwj5EOmNb
	jCaasxT5U/zuOttwhY60D+0Atc8+9h1BmzJ9TRCzlflZPIesE9ZR3A9EzwSCrINNNuc3sHPHynD
	1Wco6j5+u4t7rf6y9GzAInbByEwmxv2PQqlQu/8DaNHQNmr7H5iEGpg==
X-Received: by 2002:a17:903:110f:b0:2cc:92ae:b36 with SMTP id d9443c01a7336-2ce82970406mr160410595ad.24.1784031369725;
        Tue, 14 Jul 2026 05:16:09 -0700 (PDT)
X-Received: by 2002:a17:903:110f:b0:2cc:92ae:b36 with SMTP id d9443c01a7336-2ce82970406mr160410315ad.24.1784031369221;
        Tue, 14 Jul 2026 05:16:09 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b87b92b27sm36384127c88.6.2026.07.14.05.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 05:16:08 -0700 (PDT)
Date: Tue, 14 Jul 2026 20:16:03 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 6/7] dt-bindings: arm: qcom: Document Nord IQ10 RRD
 board
Message-ID: <alYog0QKJpp1uNEh@QCOM-aGQu4IUr3Y>
References: <20260709132013.4096850-1-shengchao.guo@oss.qualcomm.com>
 <20260709132013.4096850-7-shengchao.guo@oss.qualcomm.com>
 <20260710-adept-lemming-of-superiority-67e928@quoll>
 <700807bf-7227-4f9a-bd22-afa78c58e44c@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <700807bf-7227-4f9a-bd22-afa78c58e44c@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEyNyBTYWx0ZWRfX4aG3YzNQW198
 goJjc4+SxVbwk6KVg8P5JC2XAW1mrFp1Mnj+QgawXXq2s+2PRVk4bWz2OSJimfNpWv2Q9AgBBvS
 08GuvihmaQNUktGbW6SSdQ9IjR5+OTs=
X-Authority-Analysis: v=2.4 cv=N4UZ0W9B c=1 sm=1 tr=0 ts=6a56288a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=etiA4oEk7rotVbtgFccA:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: RItJBTZLqy6VbB8IG3sfSKtRVtohCqYG
X-Proofpoint-ORIG-GUID: RItJBTZLqy6VbB8IG3sfSKtRVtohCqYG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEyNyBTYWx0ZWRfX9FSZP9wHfUIR
 s8ag8rbrIITEguaPsakvUM+yoO/iC8g6D7o7MruNigyQxdZeW+MF2zoOoG+skVnQ1YzTy0NE/re
 /gWoxqxygRafdt6dY2Rg106ndihzmHIo2eiFnyHRC0OIoA9PU2GkQ5Dajc0YhO0MjXoc0MqrQPC
 gdyoVzHvnfAUiXvgT3XJrTyByz1yvcEf2h8KGj1liO9Y18jb1dj4lYmeZcKkjLlR7SHcnyGFksy
 AR9Pth7zpW/Wc2jtn+jVYQz9HFjsMiBY/LU4AhV28sP0pFv+X8PmvvRLIroq5QGpdPygMa8Zwao
 bwBrc+mqiWw4YkfXqbbRCG1uWbLIjsxNp88iYV1poilJQUyXjKqlL0k7PhI0V+xw7Os6p43EY+2
 CntDJStSaEBW1+zK+rskE92lb8+zW9uwqa00iJBtLVjHgqpN4J3MfLSq1yFDnP6pyzUjmjOuXfm
 iPU10LO974kvntZ3jWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140127

On Fri, Jul 10, 2026 at 09:07:18AM +0200, Krzysztof Kozlowski wrote:
> On 10/07/2026 09:04, Krzysztof Kozlowski wrote:
> > On Thu, Jul 09, 2026 at 09:20:12PM +0800, Shawn Guo wrote:
> >> Qualcomm Dragonwing IQ10 Robotics Reference Design (RRD) board is built
> >> on Nord Embedded variant. Document the board.
> >>
> >> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> >> ---
> >>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
> >>  1 file changed, 1 insertion(+)
> > 
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Actually this should be squashed. Adding trivial board compatible per
> patch is way too much churn..

Sure, will do in v6.

Shawn
