Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049C237B3F6
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 19:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779736960; cv=none; b=dZH6IFy9Iux6pqtK2yErYqLuIdR03/I9o8jCi5szjjkvQtdW8RWEX9ZELObFx5Y9R9ePcU41582nGVlEBP3MVSTSwXbqbZ7kkA5hckam5qwSF6ftCWpJDLZLC9PIwcyET7Zir5HkA0BYwSPJuN5ag7PjN3J8WE0cfrUVzjyb+ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779736960; c=relaxed/simple;
	bh=K8ekZJA7THTLn3ZUpFVlilgkwvxw/Mw6zqNNZdgLBb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AE6Rl0PlXD8kzUjlZRqDkPXkLi7NwQxTcwNw/7lt76t9WUVHB3kCeYBVSMEcJTd+8qcZ3WU6xRz5jWSsjL+jlezW4j6GMcBM5HDiQUFmNs6oYRUjcAiqL59gQIWZjJaOGo4osn+a4lYnATm4Kp4zTPAOh/r1502k4H4oB7N6uO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L50HHqsS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HdAdkPmL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L50HHqsS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HdAdkPmL"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64PI3eAk079559
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 19:22:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=itmu+XDGDMrVTyuklbP8cmHl
	NlCmn3eMyCh8ieSAYyg=; b=L50HHqsSg9ui0E/noT2ysx1/uqFXvF+x4DPLIobx
	U5FYqYbntnQjCjtsyQbbmdP1URdr9fn0iST52nG51iDqQ2kAhf65YmI2RUnow8Y4
	jx8/LCY7aARy7aSjILqU9JuD+dIJjb6PNfaCFfe9FT8LZdl/IzDnqqzmoP7+/TFB
	Rba8uo9B+Mr2GZSXdrZNkR/UKNCxoGDdNMlJ8/g8jEzqalyy0s5vig22dfVGza0u
	UXu7lSigF1bruV+C4Akn6fnmmqez3sJeplmRvV/Dtev+0nFBRkezk98o8hjvpFx0
	uj2C1KvFq4k1SE1g8splFvw9ocffA7kKXocOi7ZLkTiwNA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eckma9tg8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 19:22:38 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-95cf2f6a8d6so13925199241.1
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 12:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779736957; x=1780341757; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=itmu+XDGDMrVTyuklbP8cmHlNlCmn3eMyCh8ieSAYyg=;
        b=HdAdkPmL/McT/VNkYysgFKuZUiWPOCJX2J6l5FEhDVJKngo13pkeAfljPUs8gaVblJ
         R9qqzAmadzIQ2XRnyX87gPlWW/9t5XT8dWGe9JWH+wBqw7sSYsSWWLf0KP96bDiO1bAz
         Jr5DgH+8D5ntbGgt5++Z8avOWL+8vPr7jrMSr+R8wrzIV2n1dIhMl6PMoKMxhPbNRNwj
         bwYcSXSTSav4KmO6xKfj5t8gMnNPUjK6D6J4OOlU6V8unMGzbgFY+rRq1v91eolONZw/
         3xL7KBAsT0lq9MFnM/x35i9+/8/GZdDYbRRjJg7MlqTavgRAOFLoIoMNFhtUfb6x2o1F
         9y9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779736957; x=1780341757;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=itmu+XDGDMrVTyuklbP8cmHlNlCmn3eMyCh8ieSAYyg=;
        b=mgzqbvHdcKmJnZhJjkxkv2AvTKZ4nrvfqu1xsOV+wAYfBGG7eUppTMAcsvkPS9hQpA
         rQUVblul7KSePPe+8E3UvAHKFQO3wRqO8QNKfU7JYjeVSi+n0JB9H8wzQq0wkihf2iwf
         wm9YUhOVaLNgOsiNn4ufJ0zy5uUTkMmtaelcn7ljXsIhwsWhP8E0OgF8P/P0E0d+ewps
         e0bswU6EnXNVlpnjfoT2lNqZO1mWBZQfRfNjbkcgs4ljCI3+64LSBin/cva2/D5ECgKG
         c7OMo9N98jNynx46LI/G3TfCk1MO77hDmachNea9nhVPxki8PTV1H9yJk4Gs39WsPPiU
         YuLw==
X-Forwarded-Encrypted: i=1; AFNElJ+TyM+Pr78CiXK9XFXUqUpZBI+Q7s0FuhOc6RehduXZQg6gv0eQCgfOyjtiovD8M/uSvtDsNpdvay/n@vger.kernel.org
X-Gm-Message-State: AOJu0YyuP72kkiKvKqBAcG5Y+RzNFzOxSMCvHmwZjSGMi4ZNtOsZfja4
	yJ548L6eXVYkjoBPa/HDaYYC6EvJrhdYKfVy/xajzczi/gIQHAQwzORt/Zr3VFGnrWiMvonQY6w
	UlFIcKPWuzll0EkxGa60ek6rvhLZAN/9wu4uTZeZ63nXYgH0VJb7AthoBWol/MybW
X-Gm-Gg: Acq92OFnBgQljNfpyzuE2QIeAmYWjkxyZwhjn6/xs7TREqoVyFkZOwgRdiYg9KDKfxl
	rkU7XI/TB/scqNtGNKPdZLlzPJ+UWjxuFHur14fPXMT5xNhC9BB08amLQXgiH8mzgXtSPiGbFbn
	m77sjYa/BMkRbKHLVXJRZqlMqkKPPeFhaMT1vekVPTMMyY650N1MX3rFq5GKKHjDK/qGuCGhelu
	VyDLeAhuRh9Bu88sqnc2N1UZIA2uvHhddjGaECGQvi4GWFxUL36E6tWp5/rfgGST32W8cki33cD
	fBM/VgpKUP/hbD9k8CfQW4G87PFeogpGw6QsX1iNFZLb1mfDAB7romYFc/wFnl8Tx9qGOxJXNSR
	xHe6uHiLiIyOPOa1Dvwpbb5FgVev0YP7cntLVQkokS7icz+fdI2rxITaDG9pcXwpuEywkaEtJ3W
	YOl032AAAlFDQbMgsmsgzJQq0h0b8w46hvsaE=
X-Received: by 2002:a05:6102:2a4c:b0:631:44d9:2ca9 with SMTP id ada2fe7eead31-673cbd0a917mr6095687137.13.1779736957313;
        Mon, 25 May 2026 12:22:37 -0700 (PDT)
X-Received: by 2002:a05:6102:2a4c:b0:631:44d9:2ca9 with SMTP id ada2fe7eead31-673cbd0a917mr6095671137.13.1779736956860;
        Mon, 25 May 2026 12:22:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cb367esm2908378e87.7.2026.05.25.12.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 12:22:35 -0700 (PDT)
Date: Mon, 25 May 2026 22:22:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Benjamin Tissoires <bentiss@kernel.org>,
        Jiri Kosina <jikos@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-input@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260519-glymur-mahua-common-nodes-v2-1-9f1b89a3f398@oss.qualcomm.com
Subject: Re: [PATCH v2 1/2] dt-bindings: input: hid-over-i2c: Add reset-gpios
 property
Message-ID: <bz6imhhfysbdqfushdcpmejyskkefcmeed3lqcugz5ajyteubz@dpwum3jv245j>
References: <20260523-arm64-dts-glymur-crd-add-reset-gpio-to-touchscreen-v2-0-5c333051e5bb@oss.qualcomm.com>
 <20260523-arm64-dts-glymur-crd-add-reset-gpio-to-touchscreen-v2-1-5c333051e5bb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260523-arm64-dts-glymur-crd-add-reset-gpio-to-touchscreen-v2-1-5c333051e5bb@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a14a17e cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=tnEVqwXQghL7X4JZ1RUA:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: 4YZo5YupeyJciNHMKFKQHmGdIxk6mnVF
X-Proofpoint-GUID: 4YZo5YupeyJciNHMKFKQHmGdIxk6mnVF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDE5MiBTYWx0ZWRfXyJo+mVT76nU9
 +BuMF6AOB5/vpNYPUlPFGW9a6t4N8QBlw6zzc1JpaEq61e8cF9/BmnIcjy1bDL3I7vUF3ff/SaX
 3zuLX08hbbHOjGrHQNI7P4Otv/mXfSNkldnYbiLakTzRfSW/hQEWiQUi5wB187bNUch6Mi9WXDz
 CyA9DnRVL3vajpa2cUmI6rKq7ZXLzDGIfYQ0NOcxCN0PkroQs2yOK1J0JAOB4WIiLXJTDNzFqvA
 dSbpFHU4qenc0bZkT1s4oJ3Jkoeaoj+uo7rl7ghcSfgIA4ipaVpBVKA5JiqmF1VIjmfj3QgeEbY
 O+E2LORxBLw08qUZUaiyxZmEI7fqC8pEuvGWhNtStiytJfhzlAri13AaQT9nvzatoFYsO2iA3eJ
 YEKGi178xn4GZ0d8SwsXhKsHVD9oTUrL4pPo28KdCcpXXCXmZMHE768bBW6nrNblOsvfBH/m542
 RGxA/v8N7GkFtJVO6aA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250192

On Sat, May 23, 2026 at 01:25:37AM +0530, Pradyot Kumar Nayak wrote:
> Document reset-gpios property for devices that explicitly require
> the reset line to be de-asserted during power up.
> 
> Signed-off-by: Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/input/hid-over-i2c.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/hid-over-i2c.yaml b/Documentation/devicetree/bindings/input/hid-over-i2c.yaml
> index 138caad96a29..fe0ec4fce673 100644
> --- a/Documentation/devicetree/bindings/input/hid-over-i2c.yaml
> +++ b/Documentation/devicetree/bindings/input/hid-over-i2c.yaml
> @@ -50,6 +50,10 @@ properties:
>      description: Time required by the device after enabling its regulators
>        or powering it on, before it is ready for communication.
>  
> +  reset-gpios:
> +    maxItems: 1
> +    description: GPIO line used to reset the device.
> +

If you are extending the schema, where are the driver changes?

>    touchscreen-inverted-x: true
>  
>    touchscreen-inverted-y: true
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
