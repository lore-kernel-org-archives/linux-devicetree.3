Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794303390;
	b=Ju+dz9jw5+nubZ3A4BW/XRBAXlBAd6PDpa2HYyDKC69+aqkMntkuqMCMOf8VKUlE4YoZ
	 ZKgNpz45Kwmfy8w7luWgLLfofDjiQ3CdBYFXHZcks49BNftsJi2FDq8R+IB2/+jdGTnSF
	 fJrAyLQLA02QF7baWpa/0wQgPCHZDwrTKgCmvMLQo/uh8RnVFGjoAUe55y1Al9zw2MntT
	 NTWj8WGc/4I5cUlzGpX9ByoRqIUjRTuFm93/CEahk4vhhpS0CzRC3pUL8RGk76p2InC3E
	 dzx6Hqzq/7BeRr14gTJ8IZy7pVCSvcrN6hz79GTMpPx62ROkcL1yNFJ1zNZBiIY4K8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794303390;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=eovy0BMi0junUVcwtyGGPLU45jC9y/t8YDWM7YGB4LU=;
	b=jVVnrJx+yEduVWTI+uyVbXl/G0igorGs+TSzIm3uCkzZNsEzi4UHJ9xWBwJIZmipD322
	 wGGBTclcO4pBnqVruhfYJL8TPwRyqY7J1SfoNCebcbM//ngtAC9M+sEN9CTA0G0+ZkQKU
	 6sT+vkSnwi78J7cbuo7Wm8vVlBFGKN5olwIJwYgchlMxsC3c9E7D2Bzj6oIdZ/pkvRiPJ
	 6xaEtnAUVK2fFNQ/WqnpH/mSUaYa6J2bOokS1PnUDGLw7dNNBrYDnyoquGm1bvS6cNaYc
	 bC6qYHF+1OIx9UA1Ndz4aX45aUrR5jgUizTYc4rSVC6LIpoPtlbI5If9MrdAxhEuqmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=doosE3TY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X8J0i9ck;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9096D606B9C6
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 09:36:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9096D606B9C6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=doosE3TY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X8J0i9ck
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA8ZcSN1916844
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 09:36:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eovy0BMi0junUVcwtyGGPLU4
	5jC9y/t8YDWM7YGB4LU=; b=doosE3TYxAyIQpsjTzL4mo+qHKyPi0Jd6wYbWSJK
	Bp1Aob0pINYE6OPdB27ZaXG/QMfyVmOSsEpl5Y7au3ockepFUxAZ2uYU1KdU0S4F
	OBshFpKa7VelJ/JCp0aAuSxDdp/O5klgI1qzOBmPnV/rLPu86o4QI8pT1Ld6aY7B
	atICjMUZAUOfKCUPf9hQnySzKJWbAvsE4BowU15SkST8EsSFlhR14NDgBlO/2TaT
	2o7dzZZ2EHImcB7TzMn0k5yRhGL5/+BaMrNAbqLx36bqVvWEuDMenASo6LP8Xums
	QmdRc4+R47fuNuahIS3yxTeX5XJCC/xxRdqTPBFAUt7RbA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyw487mt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 09:36:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cbf2fd504so341241585a.2
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 01:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794303388; x=1794908188; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eovy0BMi0junUVcwtyGGPLU45jC9y/t8YDWM7YGB4LU=;
        b=X8J0i9ckrqGqkMPjT1FJYbjXpBPvIbmZ9XTDCi8VS1Hu42B3zVQS5AC9GDn2/5OE+K
         rBtg64rXT34KWiJGbQ/mbYRfpFQHkrRgRJ51XBRiDM7W4T7YW2bKZmzw1IKj0M7uS3LK
         YRcCcZF3OeVpTb+CZWK3aLh4vqhJkbwfgHUWBLcJfBSK3L0CkeFvxJNZJJWWZAUKq+xE
         UtlPt/xa/Bz5bAssHMSur5QIOloqtPKO/qpb8qzUrUM5vfUSVYaqPgSSrkDp+zLp/u+i
         z6WBlnUVDJlVq1Bn+OB4YGFenQxgd/0CaU81N/5tIY6XlOqJUEpNC0R3bJg5gSUHgVWu
         EOsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794303388; x=1794908188;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eovy0BMi0junUVcwtyGGPLU45jC9y/t8YDWM7YGB4LU=;
        b=A38sRSfCO7TC8AQO9GTRBHE8botZYUFUWaJmw9ZUJ8hCIsZfqzWhLIVPhyKvDAFXyV
         aG83AIMHVOYIjdsL9EVOks5M28i7/nKEZ7CLMWfhOqeTUWuOTE89nBld5radTAT4luLQ
         b7XwxajYKW8O3898vhpL0yFDOm1leg1K/eT53k0cOZ5RLWUBp/CF/YC6OVYVasUD4kzM
         qoERI+N5wPKQh1Blw0wxELCPPFM6krtqYUHw9hZmGVRjZSv8CVlv9JO/lqnC42ROR2MM
         zNmVviehL2/uvMpPNUhDeLzExjMHDGaRSsWQWtDmL5bYkR2iFgora4lo2aPolNBNL7au
         iYOA==
X-Forwarded-Encrypted: i=1; AL+hErEv5L2vHPXXe00wcD2iSYhY9pEDLeVJSvus4+aT1zNcCr/ZlIUYTfaD1ErkJRjAQC+T190Z3B4gIo4J@vger.kernel.org
X-Gm-Message-State: APuU4Z/1R9e0nn3LIs80uc/X/WsLi6F37zCGYIOUlJeM342PXrwRdlH8
	Ar2RKBVlR5PdIVgR216j51Vpta9Dni/Yd7lmo1+51dFlHWUCHVm5hOP7WDn3mZEoQLv0ALDe/xP
	AAGB0LltwYWkxp5Nc3foNjggA6TtY8lzEZt8UPPSrGg4b/bdteso1YTWcmtXancUA
X-Gm-Gg: AYBFou2PIA5onFBtJx3EKsd4/nYnSsoDxJhyDbKQVgZkmFViHRaOZAdC5eNt+snYlli
	A9EffvpH+BQdNPFn5TXETORsGSihZg2vmjYXw6TFKcwU7EjivC3/vEG0A6z/dWifdhxUBqVSN16
	YCBeUkbvdyWLtK4eebiBNdlTu+JZCLcABDUuTVPr+jzRVUCEgaNvKX/03j/2o5tMQGj/V0wjPqF
	jeSPeoL1Pljwz7CgcyALyGDtG/xDaUirKf9YAP1N81lA1JIyN0DoQt2CG5yyM+DP+jPwy6VvnQM
	n/gqkZEGiBF1Hioe8KKsqxvXXKwtj+uQ8HN+8es4XSmELbIEv+IzD0t/N2S01sl5uBHVLRpYdAT
	RD/Y/t9aEye1pa5OikE93tLy/vFeUwRS89aCy6nJt5Ip2Ff6lUhEiUH8qJOzog2Mq
X-Received: by 2002:a05:620a:4623:b0:93f:1936:b206 with SMTP id af79cd13be357-9479f4296a6mr325187185a.83.1794303387777;
        Tue, 10 Nov 2026 01:36:27 -0800 (PST)
X-Received: by 2002:a05:620a:4623:b0:93f:1936:b206 with SMTP id af79cd13be357-9479f4296a6mr325183985a.83.1794303387252;
        Tue, 10 Nov 2026 01:36:27 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835d2c027sm4021245f8f.24.2026.11.10.01.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:36:26 -0800 (PST)
Date: Tue, 10 Nov 2026 11:36:24 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Vladimir Zapolskiy <vz@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/4] clk: qcom: clk-alpha-pll: Add Lucid 5LPE PLL type
Message-ID: <tvjdoqymeccvy7feynvozftobofvj3mficycrbgp63cicuabwk@q5va5dpwzvvm>
References: <20261107173621.3538964-1-vz@kernel.org>
 <20261107173621.3538964-3-vz@kernel.org>
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
In-Reply-To: <20261107173621.3538964-3-vz@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzOCBTYWx0ZWRfXzfrbmmA1uz9/
 70g9chqS/y9H1F9DCVTThU+TvkeBEYKg2jhVaahJpmD+g7K/Uksqu61HE2yeOoDJiH0YoGYGX6c
 apsi63qf+hR1zuWe2jCmpzT7tRUw+kO9W80ba9XNWEXU1VaL+mHObkSvui6ikEtyaAdIDW62LLP
 z7R0dwwig4VgJz+1ac+0G8OXOGWFWxTmQz3p6gJ8OYpyN8XgIR0ymtKGzwixBUJnn9NyxA8b04z
 Gpa2mq5E6GMUwlCHdAH0zKWD7Aq0IRerORkz2MLE3KqjvH/jspAyWUsB47MgcjO8QOVHIkkgfox
 eyUiFQT72e94tgqHlCbxP1a/fU3AWBFxH2jflw2Z9AU13q9gei+ev432dpScT+MUnGjkds4m4HA
 uCC6xLS9gKqRaKvtBp4wUGixz3uRVNXfIJeKHW5EQXjDIVuwCnYdmgH0jfcKWkFwhzduzxC9PkA
 tqZhTCzPc3PTLjQHypw==
X-Authority-Analysis: v=2.4 cv=Ee1d0/mC c=1 sm=1 tr=0 ts=6af2e59c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=aMfW9y36GBVf8kygzwUA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzOCBTYWx0ZWRfX95minopNf10s
 G76AqNMaBJ0/UrYdpaNDkCJDbJOZjIGPG78VG/sTyHcUVtNaM/gUlSV2RW23RpKK3Lx7Nm1SOrk
 R6gxVMR955TKrsTuKCxvoq/3W2xm2s0=
X-Proofpoint-GUID: smYMh10gtXID5Ott7dp9IGrGaU-10UWi
X-Proofpoint-ORIG-GUID: smYMh10gtXID5Ott7dp9IGrGaU-10UWi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100038

On 26-11-07 19:36:19, Vladimir Zapolskiy wrote:
> Lucid 5LPE PLLs have the same register layout as Trion and Lucid PLLs,
> but the bitfields are not identical, for instance PLL_UPDATE_BYPASS bit
> is not present, and the PLL configuration should be done by calling its
> own separate clk_lucid_5lpe_pll_configure() function.
> 
> Add a separate Lucid 5LPE PLL type to select the proper PLL configuration
> function in qcom_clk_alpha_pll_configure().
> 
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
