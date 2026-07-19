Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA46317150
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 22:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784500883; cv=none; b=T3lOvtXSeMeoXa/mV/DWlz1EQn44KLlK7Iu7TQXZXPPvjm7kEOf+jtRfXxVLujnniEUuQfNx2kdxtlUPnHsfHBLFYypBp68KdHNiHZONBoo1v94VPHT9YtlGKqZ9xjAwX4266+udRTerS+ITmSOVfyC4fVeJhyQ6tMFisFVEUNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784500883; c=relaxed/simple;
	bh=Hu3XhQuZ0TYfdwZPUp9ITftdo6OiblAWkpOPMAPxcYw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A2ypJ4+wMljq+qJg1V2qvVXyP0RjtnGht+3dVR3dhguvW4z5ukVqik0hm9Xju5H/lohv2wylI5rOPeFFNNUwmnNruWBlvN5QjG9R9YIDUMg/QGNm8hGSfDhs3IB7YKmK9DW/t4CsfAuICyLtVgfrUzKpPiyfVNpsiZge+0IHe9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MjuAtnZh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=haw8G8R3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MjuAtnZh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="haw8G8R3"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JKR2SI236615
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 22:41:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G14pMQuK0WnX0nA66QGQu45FpDKSIwIW+JyHDqzn2pw=; b=MjuAtnZhnwDXNHXH
	LgBQX1cf2yzabCiy/D1e7BbDxjyeyG9H97/X79zoQDWmWfnLpAuo+gKn0rLXVCLw
	nxULbBkN0wn3w/Qw0kRdbMJwBsgW0hyltX53LlAW/UFy0sfevW3FR/n5VYdzNJL7
	JRossYgWG7kDlJcCeAyupHnyOdtsTGqrzY3QuRW8UfICX1xeWeeY8Zp8BsVEbDiD
	DBAiy1/hRtuBdFPKaIQodhqMAny5ZWWOkhhlkO/HkHkXSdqgLQWsn+8iIN3BrArV
	h4Qsm+zwMY4VhWkRY8iVYLNYVuWExc+R/4C+yNzpSpwHMe9Nl9dVqjSvwmRysrB3
	Bn227A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2chkjpq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 22:41:20 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3811ae55313so5612056a91.3
        for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 15:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784500880; x=1785105680; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G14pMQuK0WnX0nA66QGQu45FpDKSIwIW+JyHDqzn2pw=;
        b=haw8G8R3QE72sxBQMwpGvbXH0DdUbX0aAZvQlov7aUEKYQnHO1hI01O1kBYJP/VAoR
         dQBERstvCdDi8+EKZJJhvW2wGqL+/plCPSfZ/G0Du017yX0yyzqe9hJDDVXr9uJ533Qr
         85ygxWdxWjtdTKmymu58McF4Wf6YEuAoeByg8N55ltP7IQH/ZYrSGN9woDJfFaAixhLo
         4TRHIlWg60hIPB/EgbeFb9cJTFRGXjUEs0APY1V1dif+lR6AsbTp/hAqrS16rcuR3se/
         dsSvnatBcXPndrMism0driMGpUJ9Ewo3V1TYhKLCcRBnkUKr7c7PiYuLP4c4qHiQ2cih
         Fu6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784500880; x=1785105680;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G14pMQuK0WnX0nA66QGQu45FpDKSIwIW+JyHDqzn2pw=;
        b=Jp6cCWz0Uu13kgK/SBenpb5TK8GsHc5hVTDwg/ElNUHg0eQCDXzpVQKY4YLBZfV5jm
         UdFDvp+GDch1Ai3jS2uYRP35w/+jmRf4YSi8oTHqaEwtCsABZj9c5Lgy8lAlFg2b27l3
         nJ4apAc/Kg49iwxEpApcwAPxEIF7CPvY1QNnWG3Y+gbkt5RnrWphj35EtZRbqzRI03i2
         8Ym96HrfxrK5pDZWl1mwdgoGVhxWKmkcy3HttmW35lcf+LJQsvBtnSd7FrnicdptpHcD
         wXI4qOaawI+HYWpWFNWZZhdbgO/QWyvRkmiGjy4EBCfYpbhboUheo8R3M5ZaNTMjT1sc
         pmJQ==
X-Forwarded-Encrypted: i=1; AHgh+RoFU6yRha2avw8mF2F5hwtiAmUiAciA0QT6mb7GJmzl8Vvm6Ag6r6a/UVUmqesM9olkabhlj+xbFj8i@vger.kernel.org
X-Gm-Message-State: AOJu0YzVni/tbp5ZAreRL/3ZKcpB+J5hlKhx6BeMYQX+ZjlzFyeI1DEt
	NrAUC9NvDnPQ1M8BZELjJEEzI05SJWFCN5bTnYJ7ykaR3b0ql9LdfldVOpeYI5P3GHzQ5GdfAn2
	rh5QK7IbGqBf4xa/BwN1Hb8AhwAJeKoTIrmIlErWdSKXHbwR2FOxskgnynIDWzDXN
X-Gm-Gg: AfdE7clE2njvLkesLAy9I6UkzZgU/40tHskzXCV2o5VzJ8Hf5vvutrl7y3aRay8Qmh+
	0x9L3xOJvW1Zudbdigo1TSmHynXsb929tovFjogje5EbA4oCzpHVpWmFQ1z+NZ7R9dIhonYdC/9
	BtLxvOWOmtbyxk0ZuJnM3udcHrl9uBvhYQM1K0UrDo/b2fNE+tevyjBVOplgCjiN5GGnn0ihvv3
	nDglv94zS7Y2dSRzAQ+QnDnQQW39s2EUnBOE0VuH8NUcBeELGHpXuFRS+5Gk+TcVZCUHfkPJbuB
	3GOriq86d2fBLFknNP+dvr17SPW5/MVbDn20yL+jUR7dDOvrvVRVPPaj98FCJm+pbEcmIHtflT8
	9IdE9SOVojLof5b7b
X-Received: by 2002:a05:6a21:b94:b0:3c3:8d4c:667a with SMTP id adf61e73a8af0-3c3ad7a4394mr12721145637.18.1784500879602;
        Sun, 19 Jul 2026 15:41:19 -0700 (PDT)
X-Received: by 2002:a05:6a21:b94:b0:3c3:8d4c:667a with SMTP id adf61e73a8af0-3c3ad7a4394mr12721135637.18.1784500879183;
        Sun, 19 Jul 2026 15:41:19 -0700 (PDT)
Received: from jic23-huawei ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb51a2c2a13sm3599068a12.31.2026.07.19.15.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 15:41:18 -0700 (PDT)
Date: Sun, 19 Jul 2026 23:41:13 +0100
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: David Lechner <dlechner@baylibre.com>
Cc: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>, nuno.sa@analog.com,
        andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, mranostay@gmail.com, ~lkcamp/patches@lists.sr.ht,
        linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v4] dt-bindings: iio: proximity: move LIDAR-Lite out of
 trivial-devices
Message-ID: <20260719234047.629d1a8e@jic23-huawei>
In-Reply-To: <7b8973fd-385d-4532-8213-bb0a811081ae@baylibre.com>
References: <20260714215433.41259-1-rodrigo.gobbi.7@gmail.com>
	<7b8973fd-385d-4532-8213-bb0a811081ae@baylibre.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE5MDI1NCBTYWx0ZWRfXyhV3aq+ecYYQ
 tCfWpjnw5EpOjvfdCgrBX6xZOkkl7AG3UcXE1oMkzRgpHG2q2TVcbCXB2ZFHlXDpVEumGrEjDwL
 8piMcy0hE4j7VxUMIGWYtJgWlVFovso=
X-Proofpoint-GUID: 1DI4GddA6OSKCmdVr6LTx8vk6KRBMqsc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE5MDI1NCBTYWx0ZWRfX/Cgi+ZnTXaY2
 wGxa8TBy9mSfuaAGOmhO8iDBYHNW0UivusoG5RAqyxlnod47xC2WB7agAW7tUYHgqzAk3lCVBLl
 4sNVeCpf36LQNz28LZV5OhQ7JOWgbtWlAlU3Ea2VoEaV0x/N1IxkDsa9Um168jAJDnasxSDsB+A
 uUaELiZnWZw6SYz1K6sF8wdxF7p5tfnDuiLDvs1sClGWOFTaeucjAYH6v9dqWp2kSXZPK0/mI+5
 oI33AKzkwFRFL67nJNDuShC8IVzSSxtVBzgFkrjW76yvCb8iahnLDynZfcD3sNbf5tAUjThL58f
 1YUHuXUcmXR9mXJJHdEtqn/3PNRllYy9W3H15YGxNhlxkil50s1Qy8M84Y6nZGH7Sd6pHqvW8iz
 7c91OwHozs5o3F+Jj6Ft8HNEQgW1/lXMW9KUiOrMM3O0XzKmtMeWK8z5n5Q8YCwgC2r7HZKb0Bq
 i210ZAXt+0BqmAq906A==
X-Authority-Analysis: v=2.4 cv=T5K8ifKQ c=1 sm=1 tr=0 ts=6a5d5290 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=XdlB6Cn_7BDTE3YMWMYA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 1DI4GddA6OSKCmdVr6LTx8vk6KRBMqsc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_07,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607190254

> > 
> > [1] https://lore.kernel.org/all/c39a2980-f5e5-44aa-9fd3-20e0658f62dc@gmail.com/
> > 
> > Changelog:
> > v4: unify patches rather than using a series to keep the tree bisectable;
> >     rewrite the commit msg, naming the devices explicitly;  
> 
> We lost the IIO driver patch though. The change adding a new compatible
> won't be accepted without it.

I think it is fully backwards compatible?  If so we don't need to do
anything in the driver. We could tweak the name, but perhaps not worth
the bother in this case.

