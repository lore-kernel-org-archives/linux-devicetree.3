Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686979;
	b=HFvHUWPCiwkcdSlkdtU6TYEfiTfsZ8L0J4CumoRQTHw6Cauf6YB0UvwUZiSAqRbJd7Ku
	 d8LybFhvC5EqYBKP6QGfhsBLMWBFy4tgfb4GEW3tXj7RH5k17+NgPak8s4WdnbLbxdfRj
	 33cxeSh9dcZtxxyBW++ZiIA3EbGNL3lRnA8o937VbLS4Yp7FV6B6mfRBjJFG6G1lyvUDp
	 VZwLPfqsjsBXxXpM4HgNmvWasc3GEjaecxAjEfHJtyseIy6PInJtuSQVKdiXyjpDEIB7M
	 9raplyuTtsXBBBatImNk8CvJXQkEZAnuLPobahqUp17D+bMp87AVBRVKp0FXXx7snEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686979;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GOcHW9tjnWPfy3JGXVh2ns2aT+hFNZ4ZuKMYEvOVVpw=;
	b=JtAvBe8DnJ5TNliUi73SzDCzh02oNlHvSITs+o4CLW55Idon3B9Ic0LtPozuBreMH4CT
	 EfdCWeyFyKhAayzigPXSmsfwG1cI+8EUfSH1sPaTmIaPOzZFP/PMbFhSJLc6HCS3m0XFM
	 ICu5t7nSZr7WwgVRSR2R8ahUhn9ZxsVTvMRQiSlfyx+Dfv3jmKlwTevqsxCeuV/Q8FUFX
	 72Mib7yuzkpheLXXxbrChh/wxzRyMTC2PQbI0+98vGJ0eU/cQCcuSDdAQnFtTKVTNeL4L
	 V0Su82qRTWEjYqai/eSBZeWjO4GT1q94ozaIIrX/u+8QhPtLNko+dkJT01plUW/1H0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xc2GvF+v;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="G/Z9mgt9";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E596B606A336
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 09:56:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E596B606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xc2GvF+v;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G/Z9mgt9
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7BBbw3548522
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 09:56:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GOcHW9tjnWPfy3JGXVh2ns2a
	T+hFNZ4ZuKMYEvOVVpw=; b=Xc2GvF+vY25WDOEhoJkPfrYHO+KliSW7FhBBwGbz
	lp/Q8RwpCWg2jS99vjSCijjKDNdtLH4cXHmH6qyGflt3RI1nv4Kt12YL6ivyfwnB
	Aoz2nu96rAoKH1PK6cO8a4K0PrKHiqohWchFDwn29ApJuNBaoiAsjzDoRLcjiBFZ
	AvTaGyGMe6F4bufKrpm+ggWroLaNtRw7PFDjIIIyj/piBxUoy/c6jnj7yVZs5e/R
	8Vb1nLuuHaC0ZibjLndy6qOSagAyrEaQW4GDDNKlA99xtaBO4ppl0ZHxjD00KVCd
	vLJFCRrKcPtTzayHdz8WYXNmGrGF/czJReEKfuR6JCofoQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62vaud51-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 09:56:18 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso7121692eec.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 01:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795686978; x=1796291778; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GOcHW9tjnWPfy3JGXVh2ns2aT+hFNZ4ZuKMYEvOVVpw=;
        b=G/Z9mgt97fMagk0x7M17tFwcAgSxSSMPS9tmvT8hl5L5HG4RMFwKhM4tR8uWOtJZI3
         sBZ26l1va25YCs91zS3CZiGlK3aSGVSGir9yee4SLJh+pqdt6SxSefc6BT5MJTYMEwmn
         tLyziWBJIvlcGG8ruAfejVT95Qf6dEO+W9oZ88KuL8X57+634cvY5ygcsDDX8h63b6/o
         KJj8jvqO4Ee3XTofNv/IReA7bdJ4gj8iZDBkDqRf73CdocoQ+pamO8jGcms9MT60A9VC
         VrH0Dd+mRjjGOzMdNciuHteMpUGiC4uyOjXCTzqTPDstOoiD09boDNp5YAG18GQ2ODve
         hiQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795686978; x=1796291778;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GOcHW9tjnWPfy3JGXVh2ns2aT+hFNZ4ZuKMYEvOVVpw=;
        b=lhe5pPImkNodiwVdUwXdzLKO05+b539PvSXRomOCFZetPgTJe8F/uLWJR7VVNCKqy4
         TRG+LMnn5kexF/J0yDobtYxvZo1m10K1ba42TOJY3IlAHufZT/w8/dyEJLz3aK97GXx2
         bwjCvSsP5JtHbQvi89v3CH7Va7Gz4V62xiWVNl3w6q0zfgcsZY/PhHvKWaRiBZSCmUXd
         bb6NlP4OZVcbU3jzg6UFNbnDNHleXoEfcUeb4iD1b7Ctn4uopcubEPHWoo+EQ99hn2O5
         3uWFxK1VmlW03T9eEA/lWJMM8rbuBtv7gSraMdDZXBjD5uTnz2dVP3x76f4VcuvzrdUi
         Glxg==
X-Forwarded-Encrypted: i=1; AL+hErG7+AnJyzg6d7qomzv73vf+Zq+en6HkjgcQGxp4wpNxs9IteBx2S4uUyflqK3Ll3VHxK8P1X/1X5j8v@vger.kernel.org
X-Gm-Message-State: APuU4Z/cf1iU7MSu8L88vKzW19dmrFK6J+doaRl5DIkASg6rSPnmwPZR
	3PIPXJ0lDdtpvl2GbPet5eNqaoVhUVBVpvEi4JFfWi5ZLc7WrHpmZtBuyx3hwG/SlOUuEYFyAAj
	wFkjukBz2SJSMPxIwnl/xqKtKsCd20xrxKDknR9jSdawbpRBdmlIHCrkOGjKC5ZTO
X-Gm-Gg: AZFdTZcIMtYyH+i6GV3xtSeqf++jtDIYFjMDkbgwBzNNaUVLoHSS9L01eiZBA7JlLiT
	yOdz/jdgNlYyHNTlIWNz7F2rpHbCxPwaqdNv3kNOD4QzGMYq/YM6ueUYVab8HIojeHbQROTevu6
	1RkGHmqwIXC1OlY93zDZ0SvnxU1/eLYFVxHV9xeC9ErZ4q00ue9DdCmsOKAEZQWoPJF6h57xvya
	JjzCMbniXzCaCgXANSHovzqQ57CoWD+h3XPpvFhnP35GCISMjzMHfDjPV0hOm2/AnnShWawTxBq
	G7akpvT5MzhKe+9GtSQ7biDjsIAxBraWHYtIow6WQBzIYXmrR9T96B36EqNvC9+amsy4Tr2mvnJ
	8ah8sr0rYp8BSLICXV3EwIDTH1P55bgBsN9aCH0g+QCtO0I13LeoBLbZeDzcVZQHwn+91zd6kSf
	wgg60dD+kU9uhBqbjK4kPUdQ==
X-Received: by 2002:a05:7301:182:b0:386:b4db:74d3 with SMTP id 5a478bee46e88-386b4db7924mr10926693eec.21.1795686977541;
        Thu, 26 Nov 2026 01:56:17 -0800 (PST)
X-Received: by 2002:a05:7301:182:b0:386:b4db:74d3 with SMTP id 5a478bee46e88-386b4db7924mr10926679eec.21.1795686977053;
        Thu, 26 Nov 2026 01:56:17 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm33923950eec.18.2026.11.26.01.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:56:16 -0800 (PST)
Date: Thu, 26 Nov 2026 01:56:14 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, krishna.kurapati@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Sriram Dash <sriram.dash@oss.qualcomm.com>
Subject: Re: [PATCH v5 09/11] usb: dwc3: qcom: Assert controller reset on
 remove and probe failure
Message-ID: <awgCPsPdiQDgPUR6@hu-petche-lv.qualcomm.com>
References: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
 <20261123104727.1539149-10-faisal.hassan@oss.qualcomm.com>
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
In-Reply-To: <20261123104727.1539149-10-faisal.hassan@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX/7s5rtsjNVZD
 AZMO9uzrEF2QUrGg/fhHRMgWDaZDrn9KULoVKWxv7mGHI2bZsjYogHCGHZVDmk6AMNi/npq3zye
 5Tf3WXNMkxXvMQRigSe/jf8LLp0OSM4=
X-Proofpoint-ORIG-GUID: s-WQ2hLj_a4k98hr2YXJqoYZHlqS8u51
X-Proofpoint-GUID: s-WQ2hLj_a4k98hr2YXJqoYZHlqS8u51
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b080242 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=2DI7WhOKpHI9u_kDJrMA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX7P0/RFu6GjGa
 4HJKhFJz7qmYBzQ0zGT5qRQ7q3KSEaIYxzaSGxhQLLf7UVbIcGpAFSOZMhD6lu3VPbtO7yvlhko
 D3zQkHYeO4Vi4kMZXQz9YH6jsKMHRqfTc5j+QYRZL5Sv3IiL5NzC/7xR1CS6t1VZ1RfTxPTg1Sj
 eo1TjzbTaF5OaTvSCyxCzspUu7hHPQlG5HOCPLl07AQ3mndT67jSh+7nvI58kZKqwu9nnaEHlhq
 AMhQFLFCjmTQGnJ6ZGL3Lo8hzpHEBlZhHvugXJYju99/PkEauvPVP3jq3U34Ry3I5E014dcOu1n
 Gm4OJHKew4CqwiXDJwOZOXydylP10wXMr4ViNsH4QRgxSB2w6PwX3aC1usjj5VxD0fUjDQ1EY/y
 tvFEpZRbEfAhea18qPgQvur944rVgVcctSUjUl9i01HIxMl3QRXFNaP7g62qlVxAWW1Ub5eoduj
 vDw3SbKhocMUfsS8yXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260038

On 26-11-23 16:17:24, Faisal Hassan wrote:
> The controller is taken out of reset at probe, but nothing puts it back
> into reset when the driver is removed or when probe fails after that
> point. The controller is left running when its clocks are gated, and a
> later bind starts from whatever state it was left in.
> 
> Assert the reset before disabling the clocks on remove and on the probe
> error path, so the controller is held in reset while unused.
> 
> Co-developed-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
> Signed-off-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
> Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
> Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 50fca06c83d4..61a3e3c38f59 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -804,6 +804,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  remove_core:
>  	dwc3_core_remove(&qcom->dwc);
>  clk_disable:
> +	reset_control_assert(qcom->resets);
>  	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
>  
>  	return ret;
> @@ -818,6 +819,7 @@ static void dwc3_qcom_remove(struct platform_device *pdev)
>  		return;
>  
>  	dwc3_core_remove(&qcom->dwc);
> +	reset_control_assert(qcom->resets);
>  	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
>  	dwc3_qcom_interconnect_exit(qcom);
>  

Reviewed-by: Peter Chen <peter.chen@oss.qualcomm.com>

-- 

Thanks,
Peter Chen
