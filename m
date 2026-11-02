Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793625398;
	b=ek3Fn5dFbGecB1urQXA+j0E0GiR14XW8gVJ8SZxTzvzlKZpRrusPaq5dio9zWkhgh9fD
	 QJ8tL4FTbxnZPRjE2Spbk9bUnCI31Vmbrz2r3dVbBpYOg0LkVToCD46DWDiFz6m3MxX+S
	 +mLih3cC2MEv4J3jJ9nA7DfzIC7lj5l9wT67qKERlz8ZEhkO8GYfHhLqr9TST25z1dC9U
	 38RSao01DrEkO9oXUzoPZjGJ74jnR6VIMZ7mUb/HDy5haYoP0uO8CB8SGujr7kVZrD4+G
	 2f5DyNnofO3k59E+0S/3CPqY1wozBE9l9Jj7U+IynROGWfbAXUQaJtmfSCRup/Jb+vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625398;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZPOKcmL7lQy+qX98/Hb5eqt195myTo3bkucqsGDDuBU=;
	b=2BTJgi/oRGCKa0m7harBuG4cDSNSzsdYGFSHjQXLtjzMgOiza/7MbrfBdHxjnNklfYMi
	 X08GvybxefWeD79MYFapVyXmw8FZ2kOS8CGs++S81ljddLLiOze+UFVDNEu6uwLE3/Yx/
	 bL/DsBKFnxlcBXMQdXWgF3OL4Jcdvcrus4Xl0569htgi5lU84ZTgFx+3iUK9JI1D5Mx3T
	 WlEEgeHgl4n7zp+Owl4SqxMFhca1EgaBMbE7Hy6zDJr3m+kkqD7NxU43AX/Z662WaAFlb
	 vVcXUDWApRfC9Rm7eGFO5zNFnES+y7L0Dji4dibfbtcR81T87B4Qp9bxuJGWekEJR4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oMVlKM+t;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VUHL740x;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179C2606A324
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 13:16:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 179C2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oMVlKM+t;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VUHL740x
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DATCT3423339
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 13:16:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZPOKcmL7lQy+qX98/Hb5eqt1
	95myTo3bkucqsGDDuBU=; b=oMVlKM+txmsHATfXRPiim56eCDEfI+ZgkOtJuaJ2
	iTsntX7oFB6cSpMYi7MtzOCmCAeZLp2Hk2eBMsHZ3G/JnBH4KS3yYUJbhmZnrwfl
	d3QOJJEVWQxYAg8Vp5b5Uy5Z+ZXOxPJifX53lj7l8s/JCntTvwaLifhzlXj/4apW
	l4Vn/BGBjO53mqh+ajkMYw6hGjWlfMAv1C7Pq0jqMhXrGspckrunNpWX/HAdfQVt
	An8GBY6IMkPq4vQi8bW4uufTT9Vukq+OijJLvF5/XZ2LfgMMqWqdW1Z1OAkfxqf5
	Umkt/9lAOMz+9/jqba3vznXXVti8oS17m2z8hOq6M7lZZw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrgyhf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 13:16:37 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cc175cb172so2638965137.1
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 05:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793625396; x=1794230196; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZPOKcmL7lQy+qX98/Hb5eqt195myTo3bkucqsGDDuBU=;
        b=VUHL740xVKyaiN991FpboDe4EtCVSpoWkTrmPYbIgKR6r2lViU2mOyy5QR6kuga5sO
         fFB8Zt0sPpOfU+jzLn/Imgheu6SoVfQckWgaraM6BJMTppiO9WA6ScZfqQ4oH77Z9DKe
         ttxTv7UmmHQf6sx3XlJ+eiR9h6FxGa3NAMu8N9Sp26fl1Lbx20Ztfw9CPgIxG3oKkSrT
         M4P1IiADRcKlSy5ijBWaBTXNMXEr1mYy7t0JI08RJfuok7FrSUxTT8SbUfz6Ijt/wi9/
         uWHsb05m8B+9iX7ROJSB2YFRAk9yrh9pGOkgFz2n7/vXrks2jSXB+varrbJy4+ALawIC
         RawA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793625396; x=1794230196;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZPOKcmL7lQy+qX98/Hb5eqt195myTo3bkucqsGDDuBU=;
        b=llliR2QFyhnxuDwQ3K2zLw4dINBOU/Gczj9npFAVCEMgyFqSPzo4xRcFE+Rsm+cJST
         zGJs/3CXIcKwS6kfOl0mUZXCRkyTOog/9I7mP45YtnU4VVN6RNNlPROzXBNvtKvwAlOb
         EeVJ4A8krrIrJlDfxVyFxj6egcUHhk34dRjkfiD+pNtMfBAiGuXxWmJY51/83jGxXv6Z
         RgLFSkMLfDLtD2ntFutMs9h/eDgSx67Ui/DqEMGDT5BIvkuOhRwTdcF/tSw9gVB97oJN
         7s11JDsmXye5gVmbnKMim5K9LOmKraBinDxPEhBy+HlgtjxXEPHbam6CvUPKG0a0z9oo
         j+4A==
X-Forwarded-Encrypted: i=1; AKwUvBwGzWtx6FUZdP5g1DqAtgoBwfhvdCWDQCrWo39+Poh8AMCDNjpa7JE9p6AekNMBzhEx7Tm90oWp1Qqb@vger.kernel.org
X-Gm-Message-State: APuU4Z/8C3wR+5tGhn0Qp3DL6lhmtTOHUD5XuVvNmxlDGubC7vzfWw6d
	WEab41+h7UYuwyCMZopUgIv5SB0DsOphGlr2iyLdMgTPpX8+LzKEH6/sgo5OdE1z60jDfQTih7m
	d30GrSqhSJWqAixwxK5l+2WSEkGsymqtY0hoJOulceT4deNXssjh44wNDYkOAE3Ec
X-Gm-Gg: AYBFou2xac0+M2f861g4NINn2UncHVaEGm3vwUuxxMCISUtVlvhBt4RzKSqvleQDYWH
	Vkcu4ByRu7yjo0H6unPvJf4BEXJ9cBFPJ1Bos0M24sCNHNVmpt3WZ6rBhbBngePyUrMGygZx1Nw
	nBvcJPTvvGqcVHXKTmJfIXu9jmD9XUNougTXkneQbBbxiwGHvfWuZiN0k+4+lEjc27FO2kuRP7k
	n7xDH4RPnFgk8Nf5ngjthEs6AnFakq5Ue/1V9P7w+g+VIEikw5qRQPh0eOjamM3OgRev0QTE2UA
	EoMPOy+8JQnIbJQGihwm27Ty+NsBLamyBVkow5+NIiqOmw6HS8aV1SOFngDZSw/zM6bQ80ItFpb
	ZGT7n33DUB3540mX4G0Dh3z954KLWo7fvi7e9Go1i43mfxcSwCFLIOS8J1GvEsDU=
X-Received: by 2002:a05:6102:3f44:b0:7cc:24e1:77b with SMTP id ada2fe7eead31-7d072270da8mr3880618137.4.1793625396126;
        Mon, 02 Nov 2026 05:16:36 -0800 (PST)
X-Received: by 2002:a05:6102:3f44:b0:7cc:24e1:77b with SMTP id ada2fe7eead31-7d072270da8mr3880604137.4.1793625395532;
        Mon, 02 Nov 2026 05:16:35 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81b7fe80sm388764885e9.11.2026.11.02.05.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:16:34 -0800 (PST)
Date: Mon, 2 Nov 2026 15:16:33 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v4 7/7] arm64: dts: qcom: nord-rrd: Add WCN7850
 Bluetooth support
Message-ID: <mlbqkhcqfiyajecqwh5evllyq5bc3d7fgyf7lhcdkeq376lz5r@ekmvrkztgkvt>
References: <20261031142433.1212809-1-shengchao.guo@oss.qualcomm.com>
 <20261031142433.1212809-8-shengchao.guo@oss.qualcomm.com>
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
In-Reply-To: <20261031142433.1212809-8-shengchao.guo@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae88d35 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=MF1Hv_S4EHO9a51YHiAA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: r7wABupg8vyVfLPYR9-bus_mSFauYJFb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MiBTYWx0ZWRfX+GYvTWljGVqc
 aKgdzaV0il2f4wkzcxb1So+s5LyV1bhsvR07xWCjuMlpkn6bsmcwboUrxZGBfexonUzfn/ft1qu
 6W7C2Fe71Kpf/p5HUugrs6WvRKdp0Sw=
X-Proofpoint-ORIG-GUID: r7wABupg8vyVfLPYR9-bus_mSFauYJFb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MiBTYWx0ZWRfX/54XLeSKGNdv
 rCC0ylwloUlDU9WaYgE6tY1Y/6U1AqO1xax2Jh6zqHGl/tfjmQpyKRkoR3HKb/cExk03CtvpFcH
 jD9XM9QEHJLVbH9i+8z48hp1MNOSsG50LDbiVu9SP8Ka0TyW5gMkhMOrP2rqiCZjhFiBj5QOiGm
 ObD0tPSIdNL1HtYNv2qO5AO62v/XSOLJkVy1NZ0/WTG6TEZk9vzA6pTqKrHb5hQJhmLUTkCnJYw
 5iQMJu1BT4czVz/RS6OhJvSYrMN82RvhCU2NE6Qvwk29ZzMm4bIKguhybbbXs0GWi4zI5K3a5+V
 aIObxI2heSPxeMaW7xP4bNDha4KHmt7/MxksVeLu/ukAfOt7xmLQt+vtWDhOkdHBcb2KUYRBpfi
 NnKB5kMReicf76rphYRE3WMqGtD8BR9a+/Ch/HjVrmAbh8Q6fPkLcv/qza/FnP1Jo+3IyU58sWl
 0bNNF9FrXEQhyo9hflQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020052

On 26-10-31 22:24:33, Shawn Guo wrote:
> From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> 
> Enable Bluetooth for the WCN7850 module on the Nord RRD: route the
> BT UART (uart17) as serial1, add the bt-enable GPIO (pmau0102_e GPIO9)
> to the WCN7850 PMU and describe the bluetooth node with its supplies.
> 
> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
