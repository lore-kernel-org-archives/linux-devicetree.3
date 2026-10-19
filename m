Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792444152;
	b=ciWM6TSe7K4vHV0uqSLHph66QqTMHcZZoG+ZgrURvoe9SJRfqWrm8Ys0o1S17lUwtDck
	 bgMit1I9nnwWKXnaBKRMQF/e/Nholsl2WJofZTc0nrVFNnA7Mcub+WU7YEAUm7+8PUpaP
	 alkoEZyJ5dottoApXsZL4sLvBN3vjLYN71a0DbTOTQ5b9n7tgwGNV1he7Xr30CrHBV+Y2
	 roWdMonK3RDbNj+Fv9jKhyynALzyJACuhEHQcBvrg9m09IbxbTnb3IFLX9Y5crpRjHTjq
	 dA314KJLjJIob9BRD4m8GZshOuq4mf2elUGJhdsqbZra1uhOfXQw21NvBTh1Ogr4Khg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792444152;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=I6PH5lkRkGT+Ul9o6wulr3IQ1M8M0Yi10I0lGZq7dOs=;
	b=eqDCa3TrXeds6W01N/GJq/P/vfW48ZGFV0ytQV5GQRWYRdfSrxSo/lhpP9qK+2wKmq8j
	 12zrExFkX/2YtV6WP2Fv7tyimMaejKnp0FQ2plhCuW15H6q2Af3lfF9z/9ay6X01sHN3y
	 dW233m3eTp0gnJOv6YHzaVGZJq4O7er+riOHtyPb7H7ajXJfD4zBGp6SZ+OAC1rpv50Dt
	 kjIs+Y2hrJCwI9J5dhIfDcP5rqkN+LTEztlQBogh8ORMYk1TWQDD6lIG1RAxDE1uJULWR
	 2UHkmre5cI1ArA7OqP8fZ0hfD8LW3o2u7hCDb4L8cj5XSfKo3me7LIujc5QVvU88Fbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LLqCeMem;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Cf/y3161";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CC2606A31A
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 21:09:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38CC2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LLqCeMem;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cf/y3161
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JJK4uC4189623
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 21:09:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=I6PH5lkRkGT+Ul9o6wulr3IQ
	1M8M0Yi10I0lGZq7dOs=; b=LLqCeMemUnZvxJ9jz9bTlm9WQlNXFQfobSZTvgWt
	LbG/3eBpBOOjSGsRIyVM08Wk4PRtYLCaqJOXXM9R15MjMweKe23KgWmok3u8qgvC
	v8T8y9gxJdP5wH4rm7zywGaoHMHOxCI4cPfABHLqgRODBbqGJHq4Psq+WTbZ2ww7
	P8tlFz6SfN7ZSLO9kIVf60W/LkbYv5l2DL+/OfvvPVjQSwsFFpOAwW6Irmgcd8xx
	5YAalNB8AF3wcIBLsw0/3M9oj76XaQWt/98PqJftAGVcKmUwi1yaEHuMCWDySoPD
	5mIhpJL3ZWtabzMYv7dKxxW1FR2lSvoyR88r88gKB2KrYw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf48k7ss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 21:09:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ca9b53afaso873302585a.0
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 14:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792444145; x=1793048945; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I6PH5lkRkGT+Ul9o6wulr3IQ1M8M0Yi10I0lGZq7dOs=;
        b=Cf/y3161rc75ycHM8jZhUfngFIhh/cKURTba31c+uHOEjyH7Z8PyowoOWKAziBrLWj
         f6jmdhPJ/zbp4NIo2eXkdnEdfDYRscfpr0rjo7iMS3LV1XSzvJU2TOWXOhJ2zCFPDD4x
         L7suxapKKjkbA6Vvm6CPVmBPdbKPoLLNoRKBdu2hBPmhR2wAC5t7EFqHv0xjzG8qAMNt
         enup0QCLmwVmU4UfKqWq6TpcI9rvT8+UPF38HgPZQ1V8+FsF6DUOB7QeM0i6JGGQLzBg
         ZPgcAQhIJ66PKrCsAI16NmV7shD4oFO1264HjEpTa7xIjDbqwlepnxRuXuHKLchtcVSK
         cePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792444145; x=1793048945;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I6PH5lkRkGT+Ul9o6wulr3IQ1M8M0Yi10I0lGZq7dOs=;
        b=z+9Qd9e3D5sar1Y4Gb6TH/O116GNnXIZK/RgOqJeuo8dRvYnjUUzdD9fGghTQxr6c6
         dQGViTqtMFCHsqMcRZW0glcKmXRSetdFcyxhzIIz1S7tLfClpp8B28gCZTM+hz4Mqgwp
         C2JN2Ibjzh/NAutDCQhx/MAyIxsyI8qtPzRKCXYaop5/OecoQ69ObZc/irf2WSxe+ULB
         S7MJD0Mr0msrydDUmPEzMFmIHJZqurmiCHLOqAjEoM8YYwL8ydjNg6oexOjXkJ5ZucBX
         HGiBS2Bx5yL5uEfPqk0FuMwXTk/qkxUIXZlTk7I4uLCFgjFJhqnMRpyInbiYYKYQhfKT
         GzGA==
X-Gm-Message-State: AFq9FYLxZr/EQVCv8mYDmBgYLIJNzShdXki8sAekPC6bLYR3KQgKU5um
	g6Cb30lCdqgNz4egX513FmzaXFcNxTdfaJEtlEhhtoQxQBbj7+NGb5fGEhtQ5iVn20DM/AoV2On
	5WOfq3Kf6pGojxRKi3OiWVc3+z+KvHQwEk2MRd53/zsKiv9G+Gxa77W0wJh/qgzUH
X-Gm-Gg: AYBFou0Lo5rxw4lnldew6uU5c6QhVU42LfQdqQWc/yzpVBC3PhiHPvMGYQLFOeuy65w
	usOc6yox2UInPOkdK1ioRzOJ7dbKNoysxnoQysHk5Zfm5Y9RX2dUrYUBQA3GK2I0KiQbiJJ/Edr
	u91jibkg+HZgiLyXa+2QZ6WSVROSRhVTtjUJJyJCjP2YH2MqRJEwHIsVFtnHDOUPbZtjbrs8ADg
	MHjoNbDNzRiZysZv8lROnmcSZvaNCbM/hq4QFgHjSxYWExD4r38D5X/pAC4BtnjkyYjpUOLZQYp
	Dn1J6Aboj5+W97y0YYXI6hNY9+i5hjlQeZz59VUE0ADuTPKT8k7+LvQtKMtCwsjDQ1N91UK1oKD
	75G031R16X5Z/9i7W5IvAGCWYG2ZApUTiH9FsLPeOGja9rzz/ECFeL9ySez5PMQf1fvqrmmM0lV
	VRBkHaZCi+xAUf
X-Received: by 2002:a05:620a:450e:b0:93e:d1d0:67f with SMTP id af79cd13be357-93f29d79545mr1444698585a.51.1792444145461;
        Mon, 19 Oct 2026 14:09:05 -0700 (PDT)
X-Received: by 2002:a05:620a:450e:b0:93e:d1d0:67f with SMTP id af79cd13be357-93f29d79545mr1444696785a.51.1792444144985;
        Mon, 19 Oct 2026 14:09:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a434e4csm2280308e87.42.2026.10.19.14.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 14:09:03 -0700 (PDT)
Date: Tue, 20 Oct 2026 00:09:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org,
        conor+dt@kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sda660-inforce-ifc6560: fix ADV7535
 interrupt pin
Message-ID: <pzt2y3ruacpl3eky5l6kfud66pdqd3dlnifnb5e27cvipqel4s@dx2rvvje2hcz>
References: <20261019-ifc6560-adv-v2-1-ade625df3fe3@oss.qualcomm.com>
 <sashiko-outbox-177755@kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-177755@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA4NCBTYWx0ZWRfXy2FfB5xtMk92
 IdDeLO9GrizqeXtzcNyfcUUp+1Nv1aAIqPnjGT0d+i/GJ+tIk0eZ52LBQ6wvLfLmdMMclQcRLtQ
 6wHF3fV4e8Mn9BLMpefQk9ePyYsv+0DIYiRE3JAaN7WCAqR72ot26em8puD8FQzXYdOA+c5x02x
 T5IhVVA/nLPxr9qiOzbnLsg1WosaLVtHhR4PUFpObbnm2fLoqFliRV/nAH/i+wlEx/qxlP9hCMG
 Lcctadpgg0oGm1ADkGfp3FT4Dvt36yW7sJ22MC09l5rja8DyMi8ciwMLBwSeFUDK3lMkCVABOeO
 GWzf5EV9YDimCFPYgf5RgBMTat/7cJ9H/B9dXP6V5/Kf9s+9hY8QEtNRv4YYU6uKZagSt1n2tQc
 o4D/1U6H2WDoBL8u+hH6FWrcY6TQVLYaNm2koNI3ERvqUOM2UtJTu6m5Ax8aqwoIt8ewX0zH5A8
 fgetNMP5hj7aagFNj9g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA4NCBTYWx0ZWRfX85iGHqp5v+GT
 5a9gRZ4hh8DVckJadf4CiN7x2QMGQD4MgYCyWxa6U/1OBpHr5pZrjXqVrp5pCtMLEQ9/Cnu6iJ0
 uEuJgSMq1CM9UclEwf0W1UdyQdoDyUE=
X-Proofpoint-ORIG-GUID: DAFw8x-wtM9-2hiVT5hlfjVSmXUODlhV
X-Authority-Analysis: v=2.4 cv=Qr/LTlyd c=1 sm=1 tr=0 ts=6ad686f2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=YIeo-Y4wl5u7AN86ee4A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: DAFw8x-wtM9-2hiVT5hlfjVSmXUODlhV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_05,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190084

On Mon, Oct 19, 2026 at 03:33:18PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] arm64: dts: qcom: missing output-disable in adv7533_int_default

Yes, I'll fix this later. The current patch worked with the older
pinctrl tree.

> --
> 
> commit 18e53f95f5fe825b6b2171c0f9241c69a999af55
> Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> arm64: dts: qcom: sda660-inforce-ifc6560: fix ADV7535 interrupt pin
> 
> This commit adds a default pinctrl state for the ADV7535 HDMI bridge on the
> Inforce IFC6560 board to configure PM660L GPIO11 as a digital input with
> internal bias disabled.
> 

-- 
With best wishes
Dmitry
