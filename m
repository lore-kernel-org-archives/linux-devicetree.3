Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B263EDE7A
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 08:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787561982; cv=none; b=Z/YdISCdgsTncfHSQmJi0vOX7vWWri6Eq4g3c4PdT/XGf1dHGYArSBQ9yVnmFhV1D/MSuSMwpP+92ufILr1PxNkb3TU4JhS/qJwwixKSQh3QBBj1tJIKUfjW/SXwBy39Mn+QGq0eAGzPgoiA3z8IE+OfZ/WfNdpsoOjAKO/xDsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787561982; c=relaxed/simple;
	bh=9Yeg4pEJAq2y1vfd7BWO5GQQThMFfvnhf4s5AWl9EVo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F95TdJFi0HDYW/LOKeuoJFGKf0aUe4DjfWur+V+5s3TUMc/kPF0U7txYjICh9nuNYES6o7F5DRDGc1SYDa63g4WkvqRdNLKotuVSTt4gKVxEgdYmvQjqMrprAS3lzGOYExQHSR2PFMVXHCpVe0SVBeMmFVwcE68wggDH0G+A1jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JyOIpsfu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FBQ0XDGm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JyOIpsfu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FBQ0XDGm"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O8UAAd3019232
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 08:59:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V6Uj6C5D1+nrV76LvOx+T31xK7JPMs+/Y3X09dKPsuI=; b=JyOIpsfupR88VhDZ
	JoxXevbOuacWGU1AB84hVVd/etDDKXD7slDEZ9mdh4JxcIaVrGmf60m9a3PlMdoi
	Eo0Bh5a19QkpNJglfjPifGUWAPEjchlVXNtIDsLB97t+NYDNhp9YhE1IZvbCtKKn
	ALYMZh5wCTlUrMsyD6WWcpUP1u1k01KCt/A7mw4qiQpjyKhW+qiUZs/N3SKhbO/D
	pDsLQCWdM2UXH65cM60UmwpW9D8/+BlloDGok+TG93DrI/6e+/S4w1//DU2wm8kr
	aG57QrMH1mUhU6tbcERPvmcM2LO/AN2HzfiG+rvnEk0sVtG5TGZpuqC04WnkN8ai
	XmaHNg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8jgk0435-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 08:59:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52d7ef17031so5437581cf.1
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 01:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787561977; x=1788166777; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V6Uj6C5D1+nrV76LvOx+T31xK7JPMs+/Y3X09dKPsuI=;
        b=FBQ0XDGmHAlSgBvo4UKH2UhyLveRHw9lc0rknS27OWINVBytyEKv7DBrTBiBGmWMGi
         MXfFTTd76TCXsrmyHgj9K5dDw10XHu7EZkDoTYE0t1qrfS3AFKI3iWc9UPqVGW5hrNSt
         sZ0YaerRi1hibzHHlL2yzffudX+CRzgak15y3BF0EFhsUFZRqnPl26jnMnZYsieOy3Q5
         98h8jb3TafkL6QA6eTkb6XcdRsbvEHYoylBGn4BfeQnBfpfTsO1ODfiTuco6xJkf09EA
         PfVil21guKF4LEAg3BWKscWXp2g5UqCNQ8u9HAov6IUEQX23ArYJBtzR9pwDFKtKrcdZ
         ONBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787561977; x=1788166777;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V6Uj6C5D1+nrV76LvOx+T31xK7JPMs+/Y3X09dKPsuI=;
        b=GAUntgrZxZberQuj9Z4OVql2tmYnbud3XnEtFknCRgCY7SlPy54GBoNXQEU3X7rCXs
         HP/EZzCc4z+pc2vW8aSFcfW63wjW166onvQBeyKawC9IWk2B2ltuo2eqU9b2O4xuUnCK
         YKINS0kfhux8G4sg+e6Kyi0SsCacD06WkHv6vgb1EvSL2fpnixF3ogER5pUzUVwfvkL/
         iBrbe+ypVJ29PkIz0uAjqWE+8By206EMEnkLBFyi2Fh7XtCi8uJLNQgswfkuCdLv12rA
         aTyYI4lPBvb3hR8PgHJLWIPZUmY6IYdsK18JS8l6qQPJgHl6qjYG6QB+c+t97xBCBOB5
         J5zA==
X-Forwarded-Encrypted: i=1; AHgh+Rro4Wxt7Ywenu+R2ilcMrVZ2sXU/VcvWwxT/ZbPO7L1NgapaPv+O7QbGzeg8cvQG+LIUKRHMeNIP3C2@vger.kernel.org
X-Gm-Message-State: AFuF++k29+TKcW6s5i/l59So7gpzmiiJ15e6JeL6RTGjS1tul+DNyHlJ
	x2JW3oopeK9f/DWRjg3ANgaSVqOmu4zkm/potnmrPeWKWCwm177D8JsSVBZ0TamG8RGK+UjvIe9
	SVkK41eLThY07IXegPBb/gHHmfSHgKpfGK8eJs1gHGcwK+IaCw2HN5EsEcQYoTNeW
X-Gm-Gg: AR+sD10h/bc0mskj1pCV6uLudffE538rqFMfGTIkFqoE8jChAKQS/O/r2w3XIaFTWz2
	ERQCdxwMMspCEkUJNUI35NO6klJJx8UjAzeFV17Z6QLwBtN5VQEzBQ4XbX1hje1oCsoQxaYb6NI
	a7BDAcnAfe41rtvxKynJTPpKpnhkpwXxnz2K03Tqb+O5cK0nLiGU94TSmak7VwoNxZccRaaTEm0
	mMI2uRMkHJ1bOVzbCaN196n0ReIkFUaCBvUTPWW5LTcGjwX7WtZFfWbJWq3fZTyfrhuZwd4ZnLg
	X6nk9BO7L3Mjo8gawMhr6WqV6LknUTE5RykklWkXkYQpUIHop7TIqW5J5l8ZyCuGmpgPvf82rvE
	Eg1RajZT9JjuD97iEOouEEl75
X-Received: by 2002:ac8:5fc9:0:b0:51b:f9e0:87b0 with SMTP id d75a77b69052e-52df56ad290mr183183321cf.2.1787561976993;
        Mon, 24 Aug 2026 01:59:36 -0700 (PDT)
X-Received: by 2002:ac8:5fc9:0:b0:51b:f9e0:87b0 with SMTP id d75a77b69052e-52df56ad290mr183182981cf.2.1787561976582;
        Mon, 24 Aug 2026 01:59:36 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249606bd05sm1095582766b.2.2026.08.24.01.59.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 01:59:35 -0700 (PDT)
Message-ID: <8e175474-1275-4287-9101-1c54afdfcd09@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 10:59:32 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/14] arm64: dts: qcom: ipq5018: Flatten usb
 controller node
To: george.moussalem@outlook.com, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Praveenkumar I <quic_ipkumar@quicinc.com>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20260812-ipq5018-usb3-v2-0-8f355d7ff0ef@outlook.com>
 <20260812-ipq5018-usb3-v2-5-8f355d7ff0ef@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260812-ipq5018-usb3-v2-5-8f355d7ff0ef@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: EZJ6a5NZVEpC7pdhIZaEkFhS3R2e-5S3
X-Proofpoint-GUID: EZJ6a5NZVEpC7pdhIZaEkFhS3R2e-5S3
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3OCBTYWx0ZWRfX1vpNnka/xAnq
 ou0S0/GuhcSNIJbH7fATaBcDBzkUYaTgOBzPRyXspfd0v2lG/9V5I6tVG6uIu5ihw/xYhsXtD08
 f3/6JCfyilSxwFLjl76HKidaSEwd8qQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3OCBTYWx0ZWRfX3WC9DNcbVqbK
 PkskdMEOUpof+/bIQiaTmzxEnYYIqxEFlDGKQlwC7m+gDGEt8+Sjg8Xg+vRWXjBTRIlmZT6Nw2Z
 zweq+gr81JqggGcNYdshG2jN86hwDrJBxX2D5P5JX38/x4vDPrPtHuGNfKyROAGdfAUMgRM0qQ4
 hO2R8iTPs1EY6HPIhPhl1+DSQLs/q9/jruKNqMOJcORO/Q6BzxcVOR4Dviiw11iGQQVk4pvs67P
 YA9wt6Gyj9WjrMDXDlUI4sZeIuLTnK4liWZT2JX8VAbyTtDRwt5hDpLhtQz8WifNejeTN920VrJ
 qlJ2t8McuaBQ//rIsVG4jJMM4CLEX7pNMN/qsNYpsF59pEvogHc/6c3fdXVgtI2HPv7C6wXJKTR
 OCk8G2LJTkb/8U5icAY12GQr6Ph1TtTw881TXMOUGcsANeFlcP9XtazMzWXi+YUA3rKjUwo9w4O
 grdQqHGsz476GLvD07Q==
X-Authority-Analysis: v=2.4 cv=KcvidwYD c=1 sm=1 tr=0 ts=6a8c07f9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240078

On 8/12/26 11:34 AM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Flatten usb controller node and update to using latest bindings and
> flattened driver approach.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
