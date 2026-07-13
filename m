Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0AEF386578
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 06:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783924872; cv=none; b=cDOZespIwGQSiH+jGw7NZ1VQHv3oZB4OQJeY6dVBIGhKAyMMjxPBAqmioC6QbVBtERBz9hgeMG8CA9GKCn1ojSpoKYLo16Aoy0Y3OhKobIBPhn3ZILnbKvdSHF1MLXEvOBBzpIUCClJfRGxHvOZ/AoydOeg9/prfAYQlAwVmuoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783924872; c=relaxed/simple;
	bh=w1EeN7yuKxxX4jk35szs0By6nFu+1JxWUhYfjkQiDbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SKxlyl6/cyuZfh/tvwyz+8xQFXOjIUggcxNjDPHtI3tabFA92Rz8awhmQhfC7AJ7UhQpNzfYZuKZTS3qjLFlcUkFh/cGLJdHSowA/sqdewmohU9gq8vrhVrudQi/dRKIsrzHYZ/WPxwR6OAehdVV0fgV2To5RHutKIQAREoUV98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EauNT38i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kZy36Pm2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EauNT38i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kZy36Pm2"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NuXW568071
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 06:41:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=w1EeN7yuKxxX4jk35szs0By6
	nFu+1JxWUhYfjkQiDbI=; b=EauNT38iv+UQBiWNFSTAyMON3D9efrbxEGbGyGYh
	Avcfb0Hwat+wR+hBpyy5MzXS9w8zoZ5gdDVHW1SYs6eloPyuQ4KDLcoLm4yXYoZ3
	t4go4UKfOywBr4wo+xq/0VFNQ+RmZzZUIOC0B6BotLjedi+ucSQ/5NjZDO1ZOMNi
	lBuL9wHhzmauIREJUE44AUGig4fS/TjfghMMqBJM4z/ABaoWiQDqAvu7sUPaFuvw
	ibtg+O+rUw7Ek8az/saZN8M+EG62b6x2IAnEFsTfJJDGfshQjqNjFbZ3z4uF2eTu
	IKWNVcMFzF8uQ6B08C+BUftCYPKzpZBGNa2wGCp98I/nOw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbe914sj7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 06:41:10 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-381ed6616f7so4692683a91.1
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 23:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783924870; x=1784529670; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w1EeN7yuKxxX4jk35szs0By6nFu+1JxWUhYfjkQiDbI=;
        b=kZy36Pm2BLMxdZvNBT6X1T3ebL0C38vzxCcZ2J8P9R5VO/7NRn5FHHvEArEGBD0sG+
         YC6ApKeAO0pRSSQOv//iFAvMkiYeOR2JMMSrgb3F7MXeWgyH3R+t2FHHkKpD5PprZTqy
         d58AW/t4PF6W0QMiKmUmhtc1eoynoQ4ZLItqjSBMJgwcfJZ1nyx8iZD4PrsZeoG2HVK1
         e8rhNK4P8b4CG7SMFaqvxm0WmeZ3vEpji5snqK60zZMRzrSKEw5EzUwtEUJyfoPV57Ue
         DoQCXkVMO3Hel8QdvuA28uIM0TUT67mPjTuigzL72Wrnw6ZooFzuf/cFEhS89Takc2ns
         KvhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783924870; x=1784529670;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w1EeN7yuKxxX4jk35szs0By6nFu+1JxWUhYfjkQiDbI=;
        b=a24cWMxgPGgBlUt6ywj+5y3CimpnpygihV0fObg6DRuT/jFmAi2+Jx5Oem+qp8n3vI
         P5A7y2zLwNe473KKjgHQw0v/wiDNTGZ5naDdK9zPmpI8TTH3lpJhE5+zQY5N/fIaoCAM
         fuiTveht8VJn1GhfRvlhlfOjjnitS/eN9QyaHQJVgj2CGmrtn2Si1YIC1OmqP91lh+Xb
         hC9+Cp3x5X+0LvnpAWPjiN5vSSEZb+2/HzqfZWxk+XriTRsQCZkEkPUnRnDQMq57i6XQ
         vbfWJUsJGv1M+Sy9mT7Ide/X2ALbPS38Nnr9oUQBJDRopsMDimdsGkS2t4brdlBLWYj6
         fTJA==
X-Forwarded-Encrypted: i=1; AHgh+RoNP1NJlknyV71sotKvCxmOQAOPQCBJyHbLrfZ/zFl61MWFfdj2uBAXxk6mmWR8A7OJye+SA7tqO3uB@vger.kernel.org
X-Gm-Message-State: AOJu0Yxgq67nv/TDYUsnHzRkFbexuO5Gkg85Nfz1C3LI3nooCJojVfmn
	I6i7tF2gec1bXppFkeZLN4cdkXaO104gSUGNOIjSYtXAgRQIOi9icMF6OewzYAwDX5dBPYIvdjJ
	VTBN8LxYiP8SaBHvXp7pxcxtDfb0P27Jxvr3ILeEhfQQnJs3ijVcKVYy5jc//CArK
X-Gm-Gg: AfdE7ck+PM5UYNw/QcrzYF77LQPFXf+LiIukdZYn0WCoEVxzDi0IfyBWNqOBJjSLWxr
	IpMTcpiXStenrIDk1bfD92AqpCV74/1YkrmTIrBGsdZyx4GonUlVMgwsqHrwuwKkzV1xCe6mlYf
	8rrZNCAKh++SDtnvGYIR45vtoum68z5FdBR7trLZO0YmXsKf8Jyw5rBYAmhdpfRha6Myi5VziSm
	KxOdh0ed2DDkc54PQz1RDJ5ttbqsDIn6upvFqTENFazuZvxeq3XJpY/IphgPJG3ClE9Sg/lb+sY
	h6l0Qx/mocfzSVS/+U6yT4Q8bpXDTCLpiw1KULBiHBpvrRocb9ZZPOFZnPusCLg/nT/J6mQsI9S
	jZy1My2i486fQGQX9lXvoRdXBzMM+UeKKTCT1aypuolxOn7d2l1nErOeYxaaBR4shUxRk/Tqn2H
	mulLHMB+d5zlWJ5YBfTTSRDnm8Oj/Ne9aPIUsEL/oq
X-Received: by 2002:a17:90b:1f8e:b0:38d:eb10:6f01 with SMTP id 98e67ed59e1d1-38deb106f50mr3869025a91.4.1783924869531;
        Sun, 12 Jul 2026 23:41:09 -0700 (PDT)
X-Received: by 2002:a17:90b:1f8e:b0:38d:eb10:6f01 with SMTP id 98e67ed59e1d1-38deb106f50mr3868999a91.4.1783924869097;
        Sun, 12 Jul 2026 23:41:09 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b4cbafa1sm45465060eec.6.2026.07.12.23.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 23:41:08 -0700 (PDT)
Date: Mon, 13 Jul 2026 12:11:01 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>,
        mathieu.poirier@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org,
        manikanta.mylavarapu@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 0/6] Add new driver for WCSS secure PIL loading
Message-ID: <alSIffOraVCzfboW@hu-varada-blr.qualcomm.com>
References: <20260505102310.2925956-1-varadarajan.narayanan@oss.qualcomm.com>
 <e6311e97-0a26-4412-bcf0-d0313bf52c01@oss.qualcomm.com>
 <4a4e0e9c-8541-4fcc-8019-10a576840109@oss.qualcomm.com>
 <alAEKQzBXqjESAbo@baldur>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alAEKQzBXqjESAbo@baldur>
X-Authority-Analysis: v=2.4 cv=TbymcxQh c=1 sm=1 tr=0 ts=6a548886 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=giEOzCuHGsYyuyZPE6MA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA2NyBTYWx0ZWRfX84gIgnNASWsN
 tLPRoSaZASX3p+Drqi9VQrucYuUzuZHRBeMzglE6QNMfUY3N7U+Bb5sTjBxPdmfTGBbh1dX2Gzs
 0NG4G7qLwYD5TmM/43ztolg5Zh8eE60=
X-Proofpoint-GUID: F_7te5v-Ko4QlzN2sjvXO0hmKPaGG275
X-Proofpoint-ORIG-GUID: F_7te5v-Ko4QlzN2sjvXO0hmKPaGG275
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA2NyBTYWx0ZWRfX2hCYAEp1dpgo
 Xjo7/7Y4+5/c+ZmODqURbnj/JA5hTQg1qCjB2zIjwW6VNloEHmxFRUxH/3i2NMsxpuffHFAxucS
 IBNKWtqDpfySs/MTBNvcBtVAxTXQPk3Bs0vyUx4ocBT29hcLuca6z/CmgxIMq7NgnY3hikbJsw5
 HpmYYR5k3UFxsItwgG5FbAHg0uZzgrbOsmeWsIyQ/HLHReG3GkfKzrYaqdEdbETOyKlnXL9UJUp
 ROkKwKhL5XO4UgaJnp0Acb3T8ujO1ZGEO77fEKfhX95rZSD0vky7jrSyYEwGCXzChvk6W2XUFsY
 IhmJWNkqe9TjtHVIDcnvVpk538bCYQ6ENwmYl9DUuLh+dpTH715JfcDZOVFGP73cQ+qrzTL2LN3
 +CHkRChzAMnMmbcUnqgg/OePraSXjbonf7sPyMG8OzFQsdc3Azl6KakQO3QbduGehVfw0r5o+Jd
 ZsUqwR/Bwk8braC1yYg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130067

On Thu, Jul 09, 2026 at 03:31:15PM -0500, Bjorn Andersson wrote:
> On Thu, Jul 09, 2026 at 11:25:17AM +0530, Vignesh Viswanathan wrote:
> > Hi Bjorn,
> >
> > Could you please help review and pick this series if it looks okay to you.
> >
>
> Sorry for not keeping up with this corner of my inbox.
>
> Series looks good, please rebase on the PAS changes that should show up
> in the next linux-next.

Have posted v13 - https://lore.kernel.org/linux-arm-msm/20260713-rproc-v13-0-41011cbcda3e@oss.qualcomm.com/.
Please review.

Thanks
Varada

[ . . . ]
