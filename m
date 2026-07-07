Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE36E33066D
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 08:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783413824; cv=none; b=Xs+EwReCVzhdtOG9+iwvDE6sVBYWWJMUP19KDWSSfLcKiDM0cejywZUoWu3+OtYC44Gbed1qHoOQu0BXCjzu4O0BXgHH7tbDHTNwdRk7BJpmRzBQMTrb3vHZFri3B5L2A7wGo8kn56+3kkZcio8MnpDuO4vAZ7UnP3tSHNZpkT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783413824; c=relaxed/simple;
	bh=ndLgSXx/mBdH+aIO/R/melqhTk5w4EmPGLL7fH8ffyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ETBaFFo2o5EiZ91EEIr+zG/5Lnoeftt8pxxVH6/4GK8/sZuSHM7XGgDzHdrj1e8rcVnxpdjilDIpQRM2xAEj8NWZbEUwnCaDlVYKjaM5e1eKufxiz0im0DiR5vZ2wD5HlCvmqwBcp6eMWHwTWrB2HEEs93HGY6O7uUpbNBGCc+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PeVDUUfK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E1cJ074x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PeVDUUfK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E1cJ074x"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678Dmuc3138670
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 08:43:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Tz2heZwqcXE9G3TtPQ+L0V6o
	PZSaui8/wbpBIExE0eU=; b=PeVDUUfKU8Or2HWA2zJvNNCXoookpr8OqY8Zp6XJ
	1N6t+58r2et2rMHd+fXDcBxXLeEn5HnRB1jAbiEd1ogKt8ou037Rxkt6jC7fNlni
	ndSQYKBqBBF1OmcmaNSDZVAmMmvpakKdefgc8+1xV6BB/GTd+IOpDAsMpsdOT7SI
	ebWrFjLh2tBIPqiMQDDZbT688VIsXzQY+gyiaJLrWTEao2bFW4CInFtMu5Yk2fY3
	IW/i3VF5W1NM/dwWTnM0TyIEd8sm6JDBc28cjbzLhKlawN1O+JEglZYkXRV6bkIc
	He2ShxziCCnx3LIB7SNrxmDUifugAjI890xVpNUFpv+e8g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8t1592gm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 08:43:41 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c7f385887bso62048775ad.0
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 01:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783413821; x=1784018621; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Tz2heZwqcXE9G3TtPQ+L0V6oPZSaui8/wbpBIExE0eU=;
        b=E1cJ074xYwHV1nAy8FrwCsb/UnIk8EXm3i7IQbwIbfNrJNGOkvouUt+Vuu5MHEM26i
         qLGHgj2z0toCN6uu8Ek4kdr8KpOOX6FIvIrkDgYveim/7bTfmUVuh0AhLfG4/MWvCYIo
         VfpIIjaULD57fvUUVAVzhyUnhJWzf0u6vHKs+xLmwYqPH0AbdhtPCkL+P0m5imB1jsNn
         bWQ7lbDDpanVi8PV3LazLr6f7EEVRdfgSBdwWVcmYKYYC/qtwQoaZcb2TF1Z25uIwswi
         WOqXw6Khei1fxWQyA2+uVCtUcG5cnQmmjyHlj5Gnjt6b+jRlbL1tsYbipQJKoGxKoo/z
         EtTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783413821; x=1784018621;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tz2heZwqcXE9G3TtPQ+L0V6oPZSaui8/wbpBIExE0eU=;
        b=RGOgYuB75OXswltXKc9olza25aehCoSi1p2N019a6Jpv0WYgasrcVLwmNpmPbZ+NnY
         o2KjvJo6GO7d1V44J2wT6SWlN+AUZIVLf+L7dZmK3m/OmOTg7JTEuGKFyCHjN6i15fVB
         k9vTujA6rfpumQwYGv9e8TDL+e6fpZ7B9zusaXORo9eFqGiSPjkT4270GubjStROH+87
         viO6LMcrkxlz8ztjLk1ItF4KmrYO9gjQl1gZ7a7OEWVHH3XFThgKIPpuWu7PHqFjgm8O
         H1UamIwjKkt41OGCFL8HNuXDOiIl+EtMxubdytekacvBzmSGicgxfKVWNszU+2eJLJWc
         vO4Q==
X-Forwarded-Encrypted: i=1; AHgh+RrJx3RfL4J0bbucPsKr4UDOw57mHhqaP5l12gBnSTTk9Fij0k0ervF7TgSVqSDJFLCMRR9ssDK/JeOl@vger.kernel.org
X-Gm-Message-State: AOJu0YwPfJm5WUar5ngYGXiYaymbZWMXagljhOPSEyjfLoybLQF70l6t
	C2kfqkJyK4QxKUXqrQMOji/DbRvP4YDGclqlusbjbjOaNyqUpAKx3DkDM2BJy48cUZaXFbrwlga
	UvHrsKtZyzQVg1z5m7nVDhcIubu38u0GthUjfw8KtOP9LO3ui2zn4ybq/xWOAak+r
X-Gm-Gg: AfdE7cnNIt69g9peANyp6Audar/I74WMmIAeNq0a0gTGDy63FzXp659ivdON78ZlU7W
	88HmE+WJAcFyOwAsezSlAAcgZxkcUmQJ243rGAjocPT91zPkNAvzpLq2G3noWIsv06UxWEamsdI
	+gM9NpcgrMIATd7YcDmHR8Osk5TKOufuASX9wGS4QSRi0zeyFg2Uh99Jym5Qy0a7zvTcXy6FzUq
	V71s9MbYQXJHdqkjXTUHKG9r6aVlOJBjb/YfIt36ikk62KtudaojiNwvdiqr70T+uFzZxrT/UnV
	c+dhW6FmtGAIqZnu1Qry6CApXcoL1V+l8WyJJGYyng/gg35yxmATIA6/IveTTPWzoAqaUfRaWof
	GjMc5vlAUiOy6Cr/13y1DHocu8z9gAqqiVx8/aSLVwAteV7Ejie03MQ==
X-Received: by 2002:a17:902:f611:b0:2cc:6817:d9bc with SMTP id d9443c01a7336-2ccbf087932mr43714695ad.38.1783413820751;
        Tue, 07 Jul 2026 01:43:40 -0700 (PDT)
X-Received: by 2002:a17:902:f611:b0:2cc:6817:d9bc with SMTP id d9443c01a7336-2ccbf087932mr43714455ad.38.1783413820227;
        Tue, 07 Jul 2026 01:43:40 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb56fsm7935935ad.15.2026.07.07.01.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 01:43:39 -0700 (PDT)
Date: Tue, 7 Jul 2026 16:43:34 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "dt-bindings: i2c: Describe SA8255p"
Message-ID: <aky8NoA3r7WsjLXw@QCOM-aGQu4IUr3Y>
References: <20260707080229.3795971-1-shengchao.guo@oss.qualcomm.com>
 <5926f59b-e0c6-46fe-a839-620a2648c335@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5926f59b-e0c6-46fe-a839-620a2648c335@kernel.org>
X-Proofpoint-GUID: T7q3-S6aTofAsuqhzN0KPjH9ruy3nvTs
X-Authority-Analysis: v=2.4 cv=HstG3UTS c=1 sm=1 tr=0 ts=6a4cbc3d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gEfo2CItAAAA:8 a=OBtQoVzB7WAZLZHqdN8A:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: T7q3-S6aTofAsuqhzN0KPjH9ruy3nvTs
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA4NCBTYWx0ZWRfX/1RmdKTATusu
 PCc41+QgOLz4W5ccU823TRe0u9gqZPMtMBzzeY2vJYrLIj5LMi82qL5UsJfgiq8lTP+9gaqqxIG
 3v/jyhh9+6LX+4dpK+Nxha6N3RLAxfY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA4NCBTYWx0ZWRfX6N0HXqiAqX2n
 GE2fL98VXSo3X4j0+EsMWfq8Dq/O/YvtR5tNjCLqwoREPhmI+cvyo27ji4j1g85Gk//+QXzD1fZ
 YtAzIZ/zxLUvZiSj3rvP3ZOiKlOQbz3v8A3r+H1MPKX61rPlXCSQnhlDQfndSDvPJA7m5yj2EFm
 49eGvjH7x5fzmdwOI/KkeGxdD3cTrECCLl02WfvpidVOpdM70qQDJyyfjmottDG3hZetvEdG1bB
 Bpw4RreTgZtF1TpI8Ih3rjfjG7eQgPDcWwJ7ped1W5QSFiTGJab3/p+ofP2rGLDmuKBFpRyAg6G
 /CVI+pyEV7fu2VlmFvNZFZ/tr0OZjiPE5IeHd6z2f2kJvRqTCq0YuPMRx/AJ/FyJNEk5E6Ne80R
 s8b5OTCLTJkIcsMk4ERTYzi2TwAyw7fcVu6Mqhz0ZPTXx2v17gB7j+MGApbTbyKznw9ZTRVa2nn
 f0HO4HxioVZz8ncAl+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070084

On Tue, Jul 07, 2026 at 10:08:09AM +0200, Krzysztof Kozlowski wrote:
> On 07/07/2026 10:02, Shawn Guo wrote:
> > This reverts commit fd359c0272bb4078f3a7ef34c1d53ee0deb59900.
> > 
> > Compatible "qcom,sa8255p-geni-i2c" had already been defined by
> > soc/qcom/qcom,sa8255p-geni-se-qup.yaml. Revert the change to avoid the
> > same compatible being defined by two bindings.
> 
> This makes no sense and to prove it: are you going to revert all such
> bindings, like 100 of them?

Nord compatible "qcom,sa8797p-geni-i2c" was added to
soc/qcom/qcom,sa8255p-geni-se-qup.yaml, as that's where Lemans compatible
"qcom,sa8255p-geni-i2c" is defined. CHECK_DTBS has been working fine by
matching geni-se-qup yaml.

  make CHECK_DTBS=y qcom/sa8797p-ride.dtb

Now with this geni-i2c yaml comes in play, CHECK_DTBS finds it instead
and starts complaining about Nord compatible missing there.

  DTC [C] arch/arm64/boot/dts/qcom/sa8797p-ride.dtb
arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: i2c@880000 (qcom,sa8797p-geni-i2c): compatible:0: 'qcom,sa8255p-geni-i2c' was expected
        from schema $id: http://devicetree.org/schemas/i2c/qcom,sa8255p-geni-i2c.yaml
arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: i2c@880000 (qcom,sa8797p-geni-i2c): compatible: ['qcom,sa8797p-geni-i2c', 'qcom,sa8255p-geni-i2c'] is too long
        from schema $id: http://devicetree.org/schemas/i2c/qcom,sa8255p-geni-i2c.yaml

What's your suggestion to fix the problem, add Nord compatible to
geni-se-qup yaml as well?

Shawn
