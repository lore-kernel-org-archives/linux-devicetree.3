Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795163733;
	b=Q7gW6YvdmA/ixkmMM94g9KyCMXfo3sKo00eNt1cOszRVer6v4JKtKCRtTqAhnBjcAnE+
	 uttPnvWkmQlMIGSt1k57vTZ0EODFoJ/ERvNb23eyov6b93ovdBjpgus7qFjno/CzbYI8e
	 6wOX8Wd7Uvgl5wsBBjoiqbMHootA5ZBRYzDixqe2skk6IjpQIC2ElOapqka9ygJsoYPjw
	 qmITtN5zJZv8mZ/VjSPBNJz70JeiUMjrFq/WATnxZz5qeSHM5V+gX6KTAGT3si2DsIh1X
	 8VdNZrxYP37iO8gFoYgQ7+3CLL8Brqm0fWCfI/nJG8vALc1kAvVvDBBHVzn+B5976hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795163733;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hBY5wVTqJ0IzIgFA/9FEwfwpYhXNkAYQbs4g4C/IQNg=;
	b=q4khjHgeRWxBW4bucBGRw+5UiF4ox61iWLAe5C2yk3dsiz0B4a1RR0qtb0xnrsq+n1B2
	 bMeJkGCWaeEh+ePX4LZ6TfdExs7AJzgJpxPL99g9nNNbzvX0vAC9QycF7BTw/bAqtKxkq
	 5pztIq9GjWpzTc5oLMxLYhRRYE356GDJfcjEHkYsmIvdNIsEPgwfhgITFIHqDD1zljveY
	 CG9bgZHsrHzG6gWLCRl3gHF/wiR4kiFvK4t/QodBmZvd3+cOpG0nw0s8DJ1MtZKdW5OUW
	 Jf2OspSqJwZEXvCRn3eA6RpYBZ1oevHFY9MQhDFc6sC0UPlKXGCrm+mNMZMLm7b+K7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="NZmEE/Xx";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=amV4y0AS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D77606A326
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 08:35:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22D77606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NZmEE/Xx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=amV4y0AS
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7frMq2695570
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 08:35:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hBY5wVTqJ0IzIgFA/9FEwfwp
	YhXNkAYQbs4g4C/IQNg=; b=NZmEE/XxcPjqXuV5CWFQxRpFNKE5Jr10PfurHbgU
	FkVtmFV5oC2/TEqkyHAC9uacgbHh/U4gMIyBInbpDvbGxE7Fid4GxDjTDxlfdwn+
	sbaUa6uKJf65NsCo+ldpcI2Rrmxu18X6mzxbpcpjqOu2jEgmicgVkmFViNyinNf4
	Ja4ek4DWVwvopZzZA++XTY6q4ldMaQAkHnz0IMR0iCfkMRtAbQgDnerHGpD7dxjP
	7XnahJra3byw2uWD72RvpwDS6F9s4AFcdv7ApjQ5OqsY0ASKBJphlDt3D3bmXQRl
	Y6N4V0f4gzDoOmjep1s/K9FH50bTHk/fRNWHUJqQFf3PHA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27au2qgu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 08:35:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94960131b4eso150024685a.3
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 00:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795163730; x=1795768530; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hBY5wVTqJ0IzIgFA/9FEwfwpYhXNkAYQbs4g4C/IQNg=;
        b=amV4y0ASfS35BwlYJQE6/A7xxWoWhZOUitXbA9gtgENnAYfrwzxj4JZqqwQf5d7nnD
         Dj6dwh/bdlXVMkvzEAtxKbidxvBbbO1JNtOPa0nUvj9o7Ip4C0s4FPT7BYOJel2+cWOv
         yng6nFGD3ZkAb1FsUW7wjW3gOOPZCv9AaYsLVAw+kzZkmYy+1MN9v+QKhgUVTpwcbw+S
         gBgJ9wojqeSU5bWY6GNckJ4XwVNRkBJMd/gDJpiaS5B3Gu7gRosf6uPbFlMV0Nxd345L
         emPKwpIgtQ/OLQnwfuWCCo30q2fxPGC8nwP1VEE0H+4xjZxFT57NZklQAnSsRud+0vmn
         +yqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795163730; x=1795768530;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hBY5wVTqJ0IzIgFA/9FEwfwpYhXNkAYQbs4g4C/IQNg=;
        b=MH5ldxXzwBnbBVlwgmLKCkWoiwK+jTRrqFtMZvNA+bjbMjZBVyA1PT0PzPak/3vKqf
         24pdxaog/PwlwfTsmJ/OWCkZ+cF+eyD1U/g+LSvEIG2eQSKhll/cU9799ITDV1j2HrzU
         v9pk5wr8NF1mJss0M7HD2E4AWozotqcxD/w/CWuMn2TiMZOWXWLr20j/ltXYPpSrCzlt
         I6YJkIlFHExFtc03nDPnqG+hfEykGdV8sbQ9C6w2Ru10Qr2Suhy5tXhIBU//EA09pBhC
         435QpTmyRQ3WhC5EfWfLris8hvz4Jo8VU8LYrP5NSIgqEdBNytEl9fFme80eFOQfe57/
         BVSA==
X-Forwarded-Encrypted: i=1; AL+hErFPm7xmiSHtmCuWyKs2bzAsLTlY4txCvRtODqKs9KJdNtWSQ6Vn28WgjK9Xm5qXr+rR7ZD82pj0Fgrt@vger.kernel.org
X-Gm-Message-State: APuU4Z8H5jFUXV1pLHsPvVPCFFjqOv2pRNulF5F3XDPjC3CWbMhs3/A+
	l0DGqEGQcZ57/hnaiaW+d0/N0g/KtwpYYyalvyTqekj5R+nKCTHJPgFDO/pc515gMBj4J/xk/oN
	Em/Nbn/E3PExIeL56N7Jc1t1tJz2/+sYoHXesbmq8dLGQTGEoFqbipyIka9UijyzB
X-Gm-Gg: AYBFou2aXeHDXeTbFRBuXVjwKedwjVinFuyXGZ5hpydV2RRteYlh42ljtn+3G56sJao
	uorU5CFLwTUmgMqoji4MC7dOrAYGPHllkkTVQ75IeHhwK/j+dOYjk9WtliqFTgs2Y8aVT0iuhoU
	OCM8Nja55zxqtipE0tLAwJacr90PQrspTHNUrlKQ57LdAqHsSSJsazLMnJQtEXp1UxQm4K1c+za
	I/mgLP2+FvTUwz9T0/cI3zmCdEGZF6eN9GaD1VmASnLUqSAIDCkG40f/bvyvQ/a7F6nUeyqu3Qq
	naFC7clqgY0Ns1ZxaTMKt1ndgqfbOz+5PQ/hP6bRIv7s/jzIwS+qlwodtxy+rHxhJNCFYy6GKjX
	8a7uL9ffzZsQ5zOL2XA5gGALbe/BonHXnfYMZRuly0T6m0Y3O8yhCQUGcvd7dhtPT
X-Received: by 2002:a05:620a:4443:b0:949:7118:47e3 with SMTP id af79cd13be357-949bab4d96fmr378868585a.58.1795163730196;
        Fri, 20 Nov 2026 00:35:30 -0800 (PST)
X-Received: by 2002:a05:620a:4443:b0:949:7118:47e3 with SMTP id af79cd13be357-949bab4d96fmr378864785a.58.1795163729507;
        Fri, 20 Nov 2026 00:35:29 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b8b7888sm3967531f8f.42.2026.11.20.00.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:35:28 -0800 (PST)
Date: Fri, 20 Nov 2026 10:35:27 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Fix
 DW9800K support
Message-ID: <infkyto252rc2ocolww4ihjuptd5xg5qcjtkft7gpyssxhp234@4dnragxtdfxm>
References: <20261119-b4-dw9800k_cleanup-v4-0-df26c431595e@fairphone.com>
 <20261119-b4-dw9800k_cleanup-v4-3-df26c431595e@fairphone.com>
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
In-Reply-To: <20261119-b4-dw9800k_cleanup-v4-3-df26c431595e@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzMyBTYWx0ZWRfXyg4k6kYz+KWg
 IaTeH8kX7DjpgkDbK7fFxETsX3JrjAaSIkjdbpTNuduEXhQfsRVMyxPNnJyLDuEyEG2R3xseUXq
 2i5eW+u/3b6utUeh/PYQylT/Ut6DVCfN1buR6MKnpEkyY/kiCfbJ4eXIHIbMO5dksTc/okCCKVI
 FeEVm5ygvFt/l5YrcERkmnDi69MnfNxhE7I+boIFtwfy/g/6Le1Fy2kuX7Dv3dYCQG6DUQtVzRf
 /5+wadD1/zuqADiflnve2LjkliTtQbszeII8FC5/q/Zg2WVQI71iI9E5yfFEKuXaunNmRbGhqyh
 hEsrh+xybx9BDwNoYuQnp6fCy6g/MVFxqP3Hv8vjz2Cp6PxyvmgYGVSMQqGuwYBDusGzKP7efVT
 ABUQqpsAceBp7RWKv4uDwdwn+/29z8pzvajqRX6/q0UV2cbUPekhlwdPzsKT8mJsAe1dCOugg1W
 iFClR/ATCI+GrVmAZxg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzMyBTYWx0ZWRfX63jCm7IhyzjT
 Jssju1T/+eobpbHMvukJN786Q4fkeBLrmzmupU5P/gfiiswx/NJpwzDusleQD/oFx1sHxJHDtWA
 v6Ho9UpkWUcPNRJtTS6DzOBtMomF+sU=
X-Proofpoint-ORIG-GUID: xUYK7pbxbxMVadXJ25aT3COhe-iBczkn
X-Proofpoint-GUID: xUYK7pbxbxMVadXJ25aT3COhe-iBczkn
X-Authority-Analysis: v=2.4 cv=KuHYSmWN c=1 sm=1 tr=0 ts=6b000652 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=YOuP2q-gqnfq9OsU_fgA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200033

On 26-11-19 10:51:25, Griffin Kroah-Hartman wrote:
> Update the node for the DW9800K for correctness.
> 
> Now we correctly select SAC3 mode and enable timing-control with the newly
> updated device tree bindings.
> 
> This is a breaking change for a part that was previously functioning,
> but only due to manual register writes in the driver. Now that we have
> the correct documentation we are able to update everything to ensure
> functionality with other devices using this part.
> 
> Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>

With Fixes tag addeed:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
