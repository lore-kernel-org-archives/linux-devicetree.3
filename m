Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A69530FC26
	for <devicetree@vger.kernel.org>; Sat,  3 Oct 2026 04:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791001353; cv=none; b=RKQNuPJwU/YEI4pG4GSTtOuVQVJMeYlpTQ6MmQJjXIky+B45mcHG6Ds+4kJdr/yIdqO+LgTb5l2BcH8ggaS392mr52tKoIDMBRcRXRyL4zDefVtT8lqq8UoWHa2635rPHdopwFlcsuF3lOXvkU8Qyn+H/DFL2xfIY0pR4+boJmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791001353; c=relaxed/simple;
	bh=DD4FDKqDe5MLZbpoPD6Fuf26hrheV72HpMXR6Lc65pY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lzt89loWcywBbPsePae8ww/DBKFF6CiZO/EE1TzBtvGHLZZOeaUa223ETtmZ15UC5wL0l2ZdpF+rT97QIhnp4lKujGH+5bcNdvnZVbmK/SkvfGeepIxEe78fJ7EoIv26reRk9YYJdJbJzTw9P5gWhpC/PCb0N21wEfWetnU6YCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m+4TwNA2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A+f3ugAK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m+4TwNA2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A+f3ugAK"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6933QJYx146056
	for <devicetree@vger.kernel.org>; Sat, 3 Oct 2026 04:22:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GPPhG3McnxH7twP/0eHwBUr1
	k8vDDtjVagOk1VrRcHA=; b=m+4TwNA2GEIgrj8jjh8dcCFH/XtltGie2mlLI3ob
	uGTL0u4z7w6PehJZenTVf61k0Em0a4eYPjy1qcQNTE9Mt+oVEnU2Knxp+b35uidY
	W2bS67Mmdv6ZIe66W4ZU/z+iHOdVf9CXdomkbuBRuG+bvInlhR7lRHcXhK2PX45p
	xWSXAl7m61SUJOyDy5L8bPllGlZu2NuzsW5xD3nAviZWj67oyAHMwbLihnALHedz
	M//JTsYqYXTXTOtxiWFjHhr+r2KE/9z2xxmNWV3az/AVL1VRHN0cvtqAjrSfjXtn
	JYwZIDfHt3VeakJCQ8ZI/QS6+i2lEXBHvjL+sIZdToGKrQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2sssg2nt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 03 Oct 2026 04:22:31 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-139b62317d0so42197c88.0
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 21:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791001351; x=1791606151; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GPPhG3McnxH7twP/0eHwBUr1k8vDDtjVagOk1VrRcHA=;
        b=A+f3ugAKdtyR+Ch5uscneypO6Pg4fhiU2wrUyoUJ6RUuYo3XHV+Hqu2YB3r4RAbUUx
         7aEBLtxvBTVw0zcPjryL38ktiavM0IzYMy8svfzgUkTb9cv8gzJgj15IsnXNjjW+ahwR
         F69XE0/drw28f+IbgqGZxlFXpH/i7GcwAJGMHUrEdhX8qxVXaGWhCJUwQkcEsZSya6at
         fa6vkicL0/Eve4+rWqG+YIgpAk6BYgcSvUBzGf7CXEudTIBFAz7kG/rJaNCXwkeuCqJ9
         0wM3Q/er5rOU8gMibcD8dn6pI4Q7VwJ14M43VwS1RT+cFNfGmAl5xMhWVriR/xOUVy+h
         H/aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791001351; x=1791606151;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GPPhG3McnxH7twP/0eHwBUr1k8vDDtjVagOk1VrRcHA=;
        b=xpYoGqJK3ZO8ci7aF7bX9J8QlET5DJkrwzE5GDfqGnmHUJb6T+JyDhliDh6rUnY2ot
         yO/BebgqXbhb0ryHCMnnQRifVvXZ+Y0EjC+6C9O2NLPHOs9Wi8Of5fIBdb7vea7P0Ohy
         1qI67d5tR6RIO2XYhXed72ZyIxsjDv+MnBp0Q8VY5GProb6s9G9OtJfKFYEcOBjRa8J7
         +ZhFtqoVpNQJ5Ou/UXtTB/YAX9/iLSDS/6vNEl+cxfrXmz1cs2sU5oI548PF6FgQdnGS
         OqVIwMHmP/JrCsTpFxXTIDOoiIrd6E52E6wpIkRcTZH5JCDPbUNCy4oKMUUssaCIapaW
         gu5A==
X-Forwarded-Encrypted: i=1; AKwUvBwV1e04OwApxattewANQ8swWM0PTLhYsa996R3h5d3cuHdW6HtmAFceBeqeK55n/wdCKgO94crbmTyz@vger.kernel.org
X-Gm-Message-State: AFuF++kV2yUUb2H5FRdcUAgmMeA7paC7XtT2DiuHH95A8mu8sTJSpW8F
	FkyMEGTT6ug/TIwOsIhfV8JRtJ8xtqWXowXaf9668fbAFq4QYYRSH0gSDfpiOvslT19ev9iw+xE
	qu4TWOi8UlkiToeva02mXXOGka+TTIT9Gtj9hWJ8Lbd/JimxVPTHf/GzsD5wtROlr
X-Gm-Gg: AYBFou250Z+ojJgo7KzUf9xl6HZ5Q3tN9frIvm83HsCWIXtEkZFLDvLygWiGBYa8R20
	5q1X2Z4uLswLazvRs8i2fite0/6t73/zmYDhnF/eP3Ew8Q/CpR+1rsHwhCuMKwHN6mo/U4xWBND
	CZ/jyjqt92+p8f5Q2HCmI3RYZuCRucyAI7FERaLuBmhsdMGQDUQTF/R9fn2ZPvjiJyKqo4eQuq3
	m06Z6zmSN6mUElxepJ8FOs5lbURLpbb+JQKc9EKnt744QZ8U0G5XSGYenz2KN5H9Fch7ZfsLQmV
	Qe1iq5P/pCnj6QlB7fxa31jBWMyw0+gJ1e4H25P01AwemCA1QjQ+YCUsBCJMU3KUKBdycshHvtN
	9xpwikJ1CSpE/RSSq9DqJYmCZdXfmzj3TWscGRAIXRg==
X-Received: by 2002:a05:701b:280e:b0:14d:523b:ce86 with SMTP id a92af1059eb24-14f5bffb067mr251788c88.20.1791001350554;
        Fri, 02 Oct 2026 21:22:30 -0700 (PDT)
X-Received: by 2002:a05:701b:280e:b0:14d:523b:ce86 with SMTP id a92af1059eb24-14f5bffb067mr251748c88.20.1791001349894;
        Fri, 02 Oct 2026 21:22:29 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-151fa74fa1csm2061919c88.1.2026.10.02.21.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 21:22:29 -0700 (PDT)
Date: Sat, 3 Oct 2026 12:22:23 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] usb: typec: Add onsemi FUSB15201 support
Message-ID: <asCC_0bS8nkFMyB4@QCOM-aGQu4IUr3Y>
References: <20260916135918.1017527-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916135918.1017527-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAxNyBTYWx0ZWRfXyXrYJlheSUdq
 cTPkSTrq6MWWpy1dhdXJI1/452RYGZ77513IevNwyUizpJtdmvriPMr3MO9cOiDddduRnLzkF7x
 BQFuD9t4P9yXMwwssOdJBZHKqSbeoj8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAxNyBTYWx0ZWRfX99hL05Ut/GHo
 UJFgO/JmzL42DoMeb9oGG4HmJTcZqM/gbaw2xpjbZIXtsxP+WJIB6M/rH8fNliNrmn9QKjlz/AN
 QXktyAKys7fuHx3lyN0jTwslh078QxXWXi6WkfKBNX8DGZA+4dv9eRp8SdE5HYJ9DxMBB6PfdBI
 mhcpdi49zfyILGrclnNHRDQ0bFafHfH4S9/5c7gpkECmhMTr95AqWiL2lvOFFHWNs+AxKIf9IwW
 JIUlSt7qQ4yEaIMhe/81cGY6oYF3oTM1TabxC7o6Ulqu64EXec3OG6BI4l3v3R1MEwWKM1TXyRA
 jRCp/OTktk/lbJXWdxQmOB7qaQOReGpQVg65iR1umMvtBJFqwIEJ7QamrFjtAzlm2OcTB1Dr/m8
 /AL4dBcMQRjRw/fM13TNm07NqnlLtY+b+HLUNKZNhe/mq/OimyPzAuBXy4vi1LMHKIUNhDF4UNJ
 aTJo0FRbBixcfL7GrHQ==
X-Proofpoint-GUID: L_yhQ47NL0NSGXWA-Oja8k6eufVSHak2
X-Authority-Analysis: v=2.4 cv=HqjjiETS c=1 sm=1 tr=0 ts=6ac08307 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Z1MyDP9Hqjn3o93XXZQA:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: L_yhQ47NL0NSGXWA-Oja8k6eufVSHak2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0
 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030017

On Wed, Sep 16, 2026 at 09:59:16PM +0800, Shawn Guo wrote:
> The series adds a driver/binding for onsemi FUSB15201 which can be found
> on Qualcomm Nord reference design boards as a dual-port USB Type-C
> controller.
> 
> Changes for v3:
> - Address Heikki's review comments (Thanks Heikki!)
> - Link to v2: https://lore.kernel.org/all/20260911073414.16711-1-shengchao.guo@oss.qualcomm.com/
> 
> Changes for v2:
> - Drop include of <linux/mod_devicetable.h>
> - Link to v1: https://lore.kernel.org/all/20260902045938.184221-1-shengchao.guo@oss.qualcomm.com/
> 
> Shawn Guo (2):
>   dt-bindings: usb: Add onsemi FUSB15201 Type-C and PD controller
>   usb: typec: Add onsemi FUSB15201 driver

Hi Greg,

How does this look to you? Would you consider to queue it up for 7.4
merge window?

Shawn
