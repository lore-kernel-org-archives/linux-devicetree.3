Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19AC937B03C
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 23:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784848056; cv=none; b=p2AY90jdH+w12xm/Xu5QI3b72fqapKlbkvTGnqUHYOfqmJFgo97XIA/Xa0UZtq7Jbco2xVkK1wnLElMW9uq5sBBF45zEE4VQI8PZLk7i6GiNizJ3iuxVGA1JrlXKNojXVOfyBDbav7PnyEv9+7DDcLGhKjbIkrEQ+tUmhNvYKBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784848056; c=relaxed/simple;
	bh=W3WAWfwjKm76x5cqeEv1mZOIhGORoHeLMYfdV0IahkU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z0EL0ttA83ZEB+cee4Gp/0mjSc5F99YWCl4aIntinqtmcXsSmQIZCGqhoEEJTvN89NVcCL21PIhLtKyn/JBJHsfkTZd/mFjVW0LY4PRFRiEAMlUyCuF07p9G3eZhZcnaQjYSeEZO0Xmd2IE6N3IKZkGw6vE8vHYq3PoAcMR/w3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kKiGqtDv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YdRWNh3X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kKiGqtDv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YdRWNh3X"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NLeYMr1069388
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 23:07:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F6JlrUHM8mWHgshlpDOWVeAhgGevmf7PFwXz3+xRVRU=; b=kKiGqtDvGGgIboQZ
	MoVtMg10Y7Lf8ehuVRwX4UWROBvZVse3QW//NjtRcF+RLxcXF2oTLt85k1D9zMXM
	wUxa1XtuMIs9BDmojQH1/si4plCQGDI/ERhkvNGYNV4atOgI9OPvGwBun9yD5FwQ
	wkpfRnB4dGNUx76CtvSYBTz8GzHDdemAgSww7fZ/E+ZCdIU2yQE7ulU8+iNGqCZJ
	tmdrcbL8Kyoo8RcNYgyOJaRnE+owQTp3Kr3Lpu0JGgCxI0ep4LpbkLiwWWXGuQQf
	4FfbrPlP669ZiXrqeOliV74XFpJO+NvUyF9aDLq+8ypmsD+QH3CFAJSIipPlH5fe
	oV+FZw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkg523ajg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 23:07:33 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ce7dfd33ffso17782595ad.0
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 16:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784848053; x=1785452853; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=F6JlrUHM8mWHgshlpDOWVeAhgGevmf7PFwXz3+xRVRU=;
        b=YdRWNh3XhkZoi2aBXC7cKFaOhWpATvCEEEBnjv2jf705lZ0z6CfqybDkHLmhtQ/AVv
         OVx7Sh+zuW5FyhuKLPZkG2mUYzgRv3zHmU/HeGhN/jvEMXZxXjMuS9OCCb3CeSvZVCnL
         K4Hfn56cEFWdwsNmmJwQhn16NLWDZKCHUvKxTJS6+pdePH/QyvpHRN3dDWr+KFh8FWmT
         9xmGVRAZkL3J0gglk8118LAxfE4XBuIZ29t1aTGbgHz8c4LA4WmPxh5fL7qS4O5O6YNj
         kwi2K4vbxsJpQiKTvgVKRIRvaWMIb9Xs/uLeF2zOxdr1ABPVHsaAx4V+GW3uKJ4Un90E
         T8HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784848053; x=1785452853;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F6JlrUHM8mWHgshlpDOWVeAhgGevmf7PFwXz3+xRVRU=;
        b=KhOzkJU+VQNA6CnlqHkTa9+X3lSH//hQcVPE77R/6S8ZJofaxRYJ/u2oNJO96aq1Og
         Ujlai7pkX6rG/w7X5gAIcjn2Dx75I5mG0qM1XVNaPBtfTJBc34SDkkEsNp9hiSRIZPfO
         Lf9kXt7URFBgW9JCxrMu8TtoI4jb6/2nvVv3WSYS5LbyW4BJkZXeAff+fp25+diEXOZq
         agJkBwa6LcydDxcenM/Y7nbumRjT8732jbQDSQ1u9M7vW6J5jskWtJGWAXEB5fOWqtA3
         pYQS9S+wO+qS62XjTHlIUOvm1+NVCgahrbNQ/7NnVXGzdUkeFFKpRN1UNhRAHx/gWfS0
         cjbg==
X-Forwarded-Encrypted: i=1; AHgh+RpKKdm20fUVrsbihPr+mvoh2HMx7wuhe5qstEPf8sgm2sI3Ax1wiiqb2vowc+wokiWmNXLvZxVYvISA@vger.kernel.org
X-Gm-Message-State: AOJu0YxOYQ+2M9Krs3QJlpwTOpw2koKhiXXQBAM99LI8OTR0LLt6/3Vp
	J/XSmr+10f0kixYnK+6pfsdM4LNAhiPLl+2IkunHtcHIhTAo2dprpSosGLLOAe3Jmib6IWMrLPL
	oERUEQi6AmBe/oBjay00uEeFnVV8Tq4di5NNCeAlYpGcZURX8rihE7aktxJkA4zbKfLcLcRn2
X-Gm-Gg: AR+sD12eO05J/GRaG6TvvQjluen9dOeM8DlRVM3/Q6bvlkRwElmW2L2dMAlggmKBfiP
	brbuStcyu3nkTJQCdIrVU3OYj4xY2WOqX05nHLevZqPpqRUfUJLIQn/+LyV0DkWCnXcslbYOseu
	xdJqWmNxa8gkIbDiQeE28ilbg6im286niiAWvjxzjRU3ji9FkaXQZMGOBJHt3LjEfvXItATKS5K
	4nKLL+u7sJvPLvHqCFeApBBqFuzDzRVZrslVwgxLgJNKOinhI6QCGLbS2exB/Tb2qv07d+pZtro
	cMgvmS4Jo3oQ+kmYP5mTy8PThK8xw/C8cOAdivODpNWIC5leuGR23TLYxwIgboecEJB+gi8nSwg
	/a89oBj87CTqp2hyZ
X-Received: by 2002:a17:903:22cc:b0:2ca:caa5:9c04 with SMTP id d9443c01a7336-2cfa74e3bb7mr62119945ad.23.1784848053039;
        Thu, 23 Jul 2026 16:07:33 -0700 (PDT)
X-Received: by 2002:a17:903:22cc:b0:2ca:caa5:9c04 with SMTP id d9443c01a7336-2cfa74e3bb7mr62119695ad.23.1784848052651;
        Thu, 23 Jul 2026 16:07:32 -0700 (PDT)
Received: from jic23-huawei ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f3be1ddsm41205935ad.84.2026.07.23.16.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 16:07:32 -0700 (PDT)
Date: Fri, 24 Jul 2026 00:07:26 +0100
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
Cc: Rodrigo Alencar via B4 Relay
 <devnull+rodrigo.alencar.analog.com@kernel.org>,
        Michael Auchter
 <michael.auchter@ni.com>, linux@analog.com,
        linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Michael Hennerich
 <Michael.Hennerich@analog.com>,
        David Lechner <dlechner@baylibre.com>,
        Andy
 Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 3/4] iio: dac: ad5686: extend device support with new
 parts
Message-ID: <20260724000726.6810f531@jic23-huawei>
In-Reply-To: <yt72xnzniqqiutxrmfbk474m6jelzfpzdc767emqiwomgxg3ez@mivshbbogi5o>
References: <20260719-ad5686-extend-dev-support-v1-0-841ec75cf5d8@analog.com>
	<20260719-ad5686-extend-dev-support-v1-3-841ec75cf5d8@analog.com>
	<20260719224351.1af8aef9@jic23-huawei>
	<yt72xnzniqqiutxrmfbk474m6jelzfpzdc767emqiwomgxg3ez@mivshbbogi5o>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DtZmPm/+ c=1 sm=1 tr=0 ts=6a629eb5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=gAnH3GRIAAAA:8 a=LT-n39R2GKJzoR_0PBwA:9
 a=CjuIK1q_8ugA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDIyNCBTYWx0ZWRfX7ufFtdf2jhLq
 /Kwd6YQBTzZyX7jBrA2F6c7t0KBJmKe/yxipG8sZl6lTiYto9/QGt5xXFvb7ljOiWo8F5OjL+JZ
 WQl90UdGNi0WiRP/ikH0DYOTdE9iIDM=
X-Proofpoint-GUID: CjAaasfw0XIFQe7GFLJT37Qs-5SVRwf5
X-Proofpoint-ORIG-GUID: CjAaasfw0XIFQe7GFLJT37Qs-5SVRwf5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDIyNCBTYWx0ZWRfXwEFHdOc5fk+m
 AC6t8HMSys7rIToCx+AwnFuvMSO7/MwQJVyzciWuxOe1mbzFPGybdXWXOsLI3CvqMidZp4dhYGj
 clDTzb8KkFusY5xbJYdJRHUIdOfuIyx63cc3zNrUI3ZZRu/4ghSD0QmOwY1dYLNX0zZAag+IXF0
 1UnU7/NJnvVS6UuaJSs2CJyJX1lJ0C57mqBICJcgST0et6SRY99fgAXDIs3j2bmyOxRR5L4h8Xc
 T28gKZJNpB+n9yBC9ZMlachs1wHXJV3DRc63JTrAlJVdToQWwdjlK1GdBhz4j3h+jwT6xHxu+Kb
 IM44g8lezJECmXG2twHTzI5ZaDFYXIVP1UKKEnUxicPv1xGW5Psxz/GyKSQiuNLSWtqCpcuHsQb
 59sE8BDpyvE0V48HsZzNcF2un1z5HkwO/QX3lDq+HVN6BfU7NAYoF0DnBpoXlstbZQHDwRQqQbJ
 UER9W948uNPH1wkSgvw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_07,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230224

On Mon, 20 Jul 2026 12:16:29 +0100
Rodrigo Alencar <455.rodrigo.alencar@gmail.com> wrote:

> On 19/07/26 22:43, Jonathan Cameron wrote:
> > On Sun, 19 Jul 2026 10:51:59 +0100
> > Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org> wrote:
> >   
> > > From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> > > 
> > > Add support for AD5313R, AD5317R, AD5674, AD5679, AD5687, AD5687R, AD5689,
> > > AD5689R to the AD5686 SPI driver. Also adding support for AD5316R, AD5675,
> > > AD5697R to the AD5696 I2C driver. AD5673R and AD5677R were missing from
> > > the of_match table.  
> > 
> > Given I'm asking for a v2 anyway, please break out the missing of_match
> > table entries as a precursor.  
> 
> checkpatch complains adding stuff to of_match table without having the entry in
> the dt-binding. I suppose the desired order for the changes would be:

With a good reason it is fine to ignore checkpatch. 

The sequence you have is indeed the ideal patch break up.

> 
> clean ups:
> 
> - ad5696 dt-binding: adding support for the 'missing' entries.
> - ad5696-i2c: add missing of_match entries
> - Adjust reformat device list in file-comment headers and Kconfig
> 
> extend dev support:
> 
> - ad5686 dt-binding changes (new devices)
> - ad5696 dt-binding changes (new devices)
> - create new chip info's and populated device tables
> - Add new devices to Kconfig option description
> 
> Does it sound reasonable?
> 

