Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8DD48A2B1
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 16:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787157988; cv=none; b=puOaClbEgl5gOgok07h0SAOSlizzKiry0TwGNMfNiS8+xT2/NjmFMVyV5/D7DOGRKcZTGffkYZ2hGB30ORULmV5xqRQ9VXENcx+C08OAqPzgUklR/UYoMe8UnCNP2el1wctlVpoE15IVUo7d+BAVAussZ2HpMv/0EB5ajmtWnUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787157988; c=relaxed/simple;
	bh=YiTvsfFB7bNds/Z7SfqqQe//GOmHOJ7p3LWjA/KuCSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j+w1LTQLo8yggjy+Rq77+R3f0eBLK5ddFMKHeUHVWpDhLJU1Vq07VwZDhL1UugJna6UIEIBlBRLg1KPuMAiJBzjx7gIsojWgaFzfxFQoyKHIMvZ/TW6K2PrG3nUuFfMfk8NQZQlzpNLLYRzHKdFYFUUCkZpotfgqMtHw47YAYC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OIkjmvRm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NYD2lw+F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OIkjmvRm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NYD2lw+F"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JEbWkx1620528
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 16:46:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YWfB7Q5tO41La60/0zJuXCpM
	Dt5Vkv3MtkfEPltGlWw=; b=OIkjmvRm49YWv1pNRWsrCxlS4N8xG+AG/vKnxjPJ
	1A2l8ADC3//jXZ47rV+n/EM8Yy9ireHqLuu8FOO08sqGGrHM0I4rCSjw2LXHU+Hy
	apaxs312Pif3Z06rYm7WNsHYfJr57t8iGhr/SOeByClmYvWxvcMFMJ74KrbHS9wt
	WJq2erG9BEDOEVMPYKT/CohgYaCAxYhFufVK2vDw4CypW+1oeS40dh1o6jeUiqaN
	HAQA9n+eBNUl1PUbRmlQFnUmUVu2tMQf4i+Nt2vJe8X/UkUf9hWAHdbX8cD6ywum
	WQ3TAKUDVH8Ifb/MSZAHpPiBv7e/528ME8g/O9+mM24CQw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5e83rrg6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 16:46:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9349c5af52bso213007585a.0
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 09:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787157985; x=1787762785; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YWfB7Q5tO41La60/0zJuXCpMDt5Vkv3MtkfEPltGlWw=;
        b=NYD2lw+FFHDNww/GJD8I5H9sGJPDS1qqq/rXQt4O4eMKMoKJBkNvJ8YDw/v2diobzN
         QoAT5HJu0yjBHztxhOp3OFQi6LMgz1X68TZTBSNT503qL+Mk9AV5vNgzcOWmEdrk24kk
         8yhP8re1ZgoEcVJa/CQVjTAfzLrjZBHcsGuTrH4vWtY5zh5ZAl/YX9CI0MuVhDcL7kY3
         z0lgLPqvuPyhmFOHwLiS4JWjAcWgtxwUgEijrpY4P03lIreulcMGx5VcbXk2btZjYH8h
         nTZ2ibk6QQ1pl8q0N3s2wQRVwAYv6pxpegONJL41ys5xTlrywgQBbQ+pd94pNDNIHXH7
         PgCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787157985; x=1787762785;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YWfB7Q5tO41La60/0zJuXCpMDt5Vkv3MtkfEPltGlWw=;
        b=ISfdIeBJAw1T5SCowhHvXnNObNYK7hYujlQV7qZF4zm2nNNwHtFXr/5giQMVrLGiEL
         HiZ0uZP1znYokDQwkyV6BvJ4C7+KqUwdP/UIHpZZ55MEgA/sdsfW0MutIqert+yH91r/
         hbTvhxVyYzFHeJ8CgdW/BKQpOI6H7iL6f/jwOMYn2SRTrz9z1x31iRWX0YJ8QCihb8hq
         kFF0AoFWTNbaJBS7oPXjf+5dNoOfZpclde/pCvCykvuzS7LgSQ1/wn/YGGuTMY0Jb7he
         HNqwI5S5o6obhqwEqaOW7GT9cn5/MYaeHXq+32V99dIMz3UpeB9Me52mupTZ6zwnBbzP
         Pe3g==
X-Forwarded-Encrypted: i=1; AHgh+RqRaBo0k+AAtVfb8RvSvloj5yvM5ymMiX5sodT1YLk4xuiZHjWSBRv0MA4iJAZSrYTaL9d5xCheFGEL@vger.kernel.org
X-Gm-Message-State: AOJu0YynbfB4atEYNGflz6qwLSck2SCL4Gzi2LZXqrTodN1bqANlMay5
	nUe/M3X84z1qYPXdrqIN6ahjpQ2YXKavBZ3HNHl4/FxvGZfHtH5a7hUO9WNh4GR5dZHgJ31QBh/
	yHr/xI50bBiqoGXZXp5FedXVn1mywRnxi4wU/D5ld1HxZ2/fnF0A3VY4F6NQnrh00
X-Gm-Gg: AR+sD12h82k9HPpjxLhAJutQWRYbAAJDCwCcIPF070dtowM5oSI7aKpQwUn3TlJCkIJ
	g7x/Kh0Vg4s0+NPKFk8jWV0s3/DvQZZQs3t6rUokGmoEeM91BkNOS5otiUCTJkaqudL37Dlvu5a
	qxlX8qmJN8QKiKMZ+Qv532Dn1ro081DqN5sHOklbdHIBCsC2FZksK085qPys/iInmuCZ5nXDkeP
	BwcVAilkYnDEPkDOc6Z5Hc46Skt+s28sPeDqTDZbxnHjGu3I+e+U6NUQ6AqjRWpN2Itn+kesgtG
	fi9akFdfq6puPev8T2lYID0A+Py2TE2vviZVK8QAqKTeQRidBTW+4aw2iuaFMU1SNbNYBXs20iO
	vTf6w3ufQ3ypQH7E=
X-Received: by 2002:a05:620a:1712:b0:933:a17:c0c4 with SMTP id af79cd13be357-9371e1de2bemr523838685a.9.1787157985071;
        Wed, 19 Aug 2026 09:46:25 -0700 (PDT)
X-Received: by 2002:a05:620a:1712:b0:933:a17:c0c4 with SMTP id af79cd13be357-9371e1de2bemr523833685a.9.1787157984458;
        Wed, 19 Aug 2026 09:46:24 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b1441748sm6914497f8f.8.2026.08.19.09.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 09:46:23 -0700 (PDT)
Date: Wed, 19 Aug 2026 19:46:21 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 01/16] clk: qcom: gcc-sm8250: Tie the CX power domain to
 controller
Message-ID: <na3brywyym7r7rnhbu4gs7z42n5gy55l5u6qmaimvvc5cguofb@ggjp36237nf6>
References: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
 <20260819-qcom-tie-cx-to-gcc-v1-1-840034124e73@oss.qualcomm.com>
 <cb3424fd-15f6-4ab7-9ff5-d82e42a13bf3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cb3424fd-15f6-4ab7-9ff5-d82e42a13bf3@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEzMCBTYWx0ZWRfX0h3NHAwFUjAN
 +1YL8cPrn92g1RbnKWwv5/DsBO2eI+6JmIxH5qlsUEKuzoU69Ld32jIuqYTiRoFxOCjLpbLBA8A
 CTzSTXff/lXR9Ae8O9MN8hhoTqO4E14=
X-Proofpoint-GUID: 1Y3s6Os2z0lTglm1wAzoY03kJp3sLjL5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEzMCBTYWx0ZWRfX49wZZHqnFgRz
 MxDqc2yITZrIkDbufrst3yzcCopC4+zwTj70rHvXC/OR4fDeYHXzHFl6CL/+d0zl+pxSQhGWTyZ
 631Nx69h4xGeEQubhvmMARvs+YgXZ4vUPgBVk+KsusRUXdanChcfuZ1gBMilgrtoZ7YdXZXCKMz
 WmJeVMUpLkqmCNK8vCCOGDK9smypDUSCrIyfrbOn62mG6NGO6bI7BQKzrNNDBpGCigw8r+1vL0o
 InjSPqZ3Vvwy2IhmWf8GB9Bdm/AEOfRYLCfgpbYp8IT16XztDz0mGCr+Sy0p/Nh3ndPuyqxcDy9
 6iXLIwqdbXe+V8AH4vIsYceq0+ZwLxEwSxqdVXwDVSBYmgiPU0s0nYFPgz1o1LPHZ+LHKvxI+Ir
 ewfexVmrDfGP2zccotJf4PL2jXdmwYIh0ToWHzh0OSwxG085v98vr6/Y+zOKOVFVhBU9anvtIk+
 SiMVUnWZsoaAK4TxHHA==
X-Authority-Analysis: v=2.4 cv=cvmrVV4i c=1 sm=1 tr=0 ts=6a85dde2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=fSiQ1cC45zYv09qsNKgA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 1Y3s6Os2z0lTglm1wAzoY03kJp3sLjL5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190130

On 26-08-19 17:25:57, Konrad Dybcio wrote:
> On 8/19/26 2:51 PM, Abel Vesa wrote:
> > Enable runtime PM for the controller so the common GCC probe path resumes
> > the attached domain while registering clocks, resets and GDSCs.
> > 
> > This lets GDSC consumers propagate their votes through the GCC provider to
> > the CX parent domain.
> 
> Not really, this is rather taken care of by the special-cased
> single-power-domain automatic attachment somewhere in the pm core

Right, my wording was poor. The PM core's automatic attachment creates
the CX-to-GDSC parent-child relationship. Without runtime PM, however,
the GCC provider remains active and prevents CX from powering down.

I'll respin with:

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Thanks for reviewing.

Abel
