Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A7736E48E
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 09:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775121412; cv=none; b=kGO8fXCkjVfFxFi2bI9vw8ux7QGn4ZuS8c81Jt6YNTLqXeM3T/6nW8dPMDIftO/aneoinukpvBIDKhMnhVHBD65N6pkrIDb0O2ilpxK+5VJ3b6AmM19kpc2itBxprq9kxkaq/yZLbos9yB1RtC8b6jU0+JkpYvuzgZUUO2H/3cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775121412; c=relaxed/simple;
	bh=UddLCTaZsnv6559x4M4lzB8DvroWR4XY2leIquweXPE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FAppWalmAV+rxtbmE1J310S5y/F3woggRcvGmY85cinVEL4PmMRwkBcDnJjPhD2Z4WBumhea0/Vvt5rswF+Zq00KfH4uKVZnPEpbH1r6t/EzxdCzXsXsZBYuJ8h8wHXziSmg3gmwnBAZt++VdIf3VixCkeULlU6f6XjDItVldkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oRyNNMzs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nap+kkkZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oRyNNMzs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nap+kkkZ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63270T3K1128397
	for <devicetree@vger.kernel.org>; Thu, 2 Apr 2026 09:16:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n277EbJU/fnSTCp3XQ5yeSpssjBDshWUW3CLO9QCTH0=; b=oRyNNMzsPc92bjMO
	TjStkDkxlvXO5Z+8RUNK3yPjI29mLdRgxJmHC6VH9K6tUqH0zQrjv0E7yDB82EVE
	BuqKfeDhRJ7zO7qKJryTIiXoesFfIJa/ZxaSt+9JmDOSvGyJMJ9e572U235DeiMN
	CH2ce/DV7lawB1+LAWQsXI9PFaHhvtVukBOd0rLKvrYIttn1YLvuLVH9UJJ5+Lq/
	vpK3wsi/lsEwzIn2aDd/oS2KDTu8h0TnxzKpV+vTi8iz90g3TGs/Ipvi9bnYEtwL
	d3+qn2h1qzinb84OhRn6+3skEH1lxBdJSmu1d9QEZG34jBM1tqwndgANeJKh1ty6
	fnZcOA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d96k9b9xt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 09:16:49 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b2d5e61f6so2027921cf.1
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 02:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775121409; x=1775726209; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n277EbJU/fnSTCp3XQ5yeSpssjBDshWUW3CLO9QCTH0=;
        b=Nap+kkkZZ40Ajq//fiKQJ8ZV+4VjlZ+4PD61CcJm5OLB0wmW4sFf1o6nwdFgbvWjsl
         7DZfjzq2VTraL6ZaNaWMnBxMnaS0UO2623e1IR/uaX7xtbfMX/BhTj7Ven/p+i9igRJE
         RBEr1/qoX0/gEFBTjgc6CFrbRIQWGIo8iHOj6WKz2nyhtRERrivPP0spIJDhgexP7hf6
         qsy6WuLhObuA4pcjckv8kGb+HDKYn9FvRYyKdIbUU+QL531P/biQ4PlDlWVJ7SB/5hOd
         fM3T/d1IF2hdHS5fvoCGLIZ9nkS85wr6S6mU5nYxrbRU9Xw9GaYRW5G9KLt8R0E9qjz8
         G01g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775121409; x=1775726209;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n277EbJU/fnSTCp3XQ5yeSpssjBDshWUW3CLO9QCTH0=;
        b=qek8Wc/M3gFP6wIg7Pr1JB/kAFF1SmmF+g2MLWe538ladBDdCXtP/oJ4czuusi/NQ/
         94I6E+gaNXqawKksbKKAyMh2232SY8OOImIGPdLQVIgJXMLC8jyuEf7Jh7i2Wi+wz4py
         MXlJy1uSZ9b8kZkS5ESS+9IhcnejiD5jXGygqmquVW2uHHB1QEdQa91i6h+eVDlTepfM
         YFhOmcxQuQB6nLj3qFcwdaynwOXM34+snxJJskfWPdkSr0zPhQ34F2aDWPk0G9OS/CTE
         GKH8YAHuQ7xcwQsScz5XUUzhMcbydIaV5bVTm5BI2ysnz9OdFbg+PQUXBET8yb5guSgj
         Qg4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVes7/DqHskmBOHhnnVHShf43SlF5Qp7hKhP51VtB1f1pEzGWYcYAS4wWx76OUT9+rbQEmcdwzV/COm@vger.kernel.org
X-Gm-Message-State: AOJu0YzUQ/N8wpM1aqOZ8VtirzUoiEcXNjqiQXyUv1Jlvl+OFCZi+RJN
	186RgBYCTwun16swqn+LOP87bovPkJ7d1kvxGXLrwLx1G4lZUlrq4ppxE/H20bHcIlKTe+b04KE
	sjM7hAyEswrNmADnJTgBiVB7bUqus16JReMGCDbV+LFQtud//XhFM/s116kl8ISh+
X-Gm-Gg: ATEYQzw+7bFHYwLXWTwawlieVfNPpnTDhsT07+a5obYfchF2C3QSo7Nv2pOdHKYDkiN
	Dvh9/EFQyqR9EuiKrnBoH9StI5dtyzotzbaGrQ7LO66CfJQWO6QzAw74Ro1DsG7Ei1epuZYV7l6
	IFTz/3BmkKOn95zkoIp14yuHdzuvkBN8iAxdRtyP3LoaY9Vyfly/k7+5mgAT8hus4jdKArLrQ8V
	Tp3jsQiriPdYPCfVvLbHhtPRlHOEp7CoVkRLmz1Nyn/JYgL6TAPcBbEz+nmSrdU1hM49t3if7Zj
	moGjLdX50CvDKUNH9oYUsvekkSOGX4QE6cG3bEs5mRLvG92D2L8h40ZlrLmdDnHLq22MCQuLhAb
	a5wfzPBjpM715Y5FNd2RMcigbtonoEY6fyBwML1jAwUeUYtgncdjXpTukfBaFdY3/E/1nNiRza3
	wJKrI=
X-Received: by 2002:a05:622a:5a1b:b0:509:2a92:8088 with SMTP id d75a77b69052e-50d3bb89968mr74474611cf.1.1775121409131;
        Thu, 02 Apr 2026 02:16:49 -0700 (PDT)
X-Received: by 2002:a05:622a:5a1b:b0:509:2a92:8088 with SMTP id d75a77b69052e-50d3bb89968mr74474351cf.1.1775121408759;
        Thu, 02 Apr 2026 02:16:48 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3d028914sm70108466b.58.2026.04.02.02.16.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 02:16:47 -0700 (PDT)
Message-ID: <1c49bd48-85af-404e-93e4-4e0eeb79c840@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 11:16:45 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 15/15] arm64: dts: qcom: sdm845-lg-{judyln, judyp}:
 Reference memory region in fb
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>
References: <20260401-judyln-dts-v8-0-cf13065e52ab@postmarketos.org>
 <20260401-judyln-dts-v8-15-cf13065e52ab@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260401-judyln-dts-v8-15-cf13065e52ab@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=doLWylg4 c=1 sm=1 tr=0 ts=69ce3401 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8 a=Fern_NpIRorMR8BevXQA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-ORIG-GUID: 5unQhCrSEzBXNyyM39NcCpK_EnOI_wTe
X-Proofpoint-GUID: 5unQhCrSEzBXNyyM39NcCpK_EnOI_wTe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA4MyBTYWx0ZWRfX2glYCt71M54X
 1oh4hIOA49n5n49DL3WbPFz9H2BQM4lCuS8oNxMDUCWA50F5QeZwt3pSCanaktAdGBJxlJrdP1E
 v+0jcCSfWXPBPEpQwFzg7dW2idQzUDS0bR2I7RPvMdu+vh7xMDIczIz/YX5q4Yj6JXZMdhNuc4Y
 y2RNwnmmeaj+LaybeXbLCqADqNi8ynfotUuQTYcwSwG60D+ZHsYbqsBDVXrrII0PRfaBwWt8e+3
 15SnFD2pW/6eC/SW4lv82BWoYiyjvx9rY/ejSnoCGMK3NYMfEtUWMnSmfiyHthLsnxGx2WDDaFs
 OcmCQTGQ+B+0Dr9aGvV/cgQ8ciAJPp1vK8mRDOj4ZH5erZXHyHKYjiDX7GISa0cAS/1V0L4QUqr
 8Wov5lMT0/5SJVhIR7N8n2cUFJejJ8z7qNElTA3J47JU6jmZICE+ulqv2urv2gx3qU5lp1tIkQG
 O9kMWPj5llCI3J1UbVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020083

On 4/2/26 8:43 AM, Paul Sajna wrote:
> To prevent duplicating the framebuffer address and size point out the
> existing framebuffer memory region instead of specifying the address
> manually.
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
