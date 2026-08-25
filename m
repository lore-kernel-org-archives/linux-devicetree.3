Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C153118DB1A
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 03:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787627721; cv=none; b=h3EVFVWeZbn6dAvmfv3MhpJUe3RqLvScta5ilrC7lPbewDIaUMzw+QLyITzIlVcOAjEdnpD7hYJsnZ4ubaOunQeVXyf5rr3yBgnoPj7mofnFflJNZc59TXyMHhjse9E+SWZLISKvhCLvEM3NqzBXuWOhPVnXRuL/r/TF6dbY854=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787627721; c=relaxed/simple;
	bh=yPWrCzoXIqgAXeIruzKGmM/XEqVv57+pEiuntlLY9pM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TxJY9viWC+7KhRn3bX0WxmxS49BF4r+GPTadMQwKomJwXoAXSiGfGbEOrSurMxKM8C1z1qjjhpYO4NfbgdZtt3MeX7r4DAlOI22Gi/nFvnnB5OFLR2i0hTx6K0mh9TSaJ24E4K59LkocDpUQYk35FFt/a+yfDToM0ssUh6R85Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BpLqdgvd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mg2Vc9iw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BpLqdgvd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mg2Vc9iw"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P2R5q9955282
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 03:15:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zw9BJ9wTlK9G8KvdBmOSxdt0qW2SYtUaRVnoZ3uGJ3I=; b=BpLqdgvdoswUs+IH
	0x3lJdhCyzU/6Lw8XTtjV3s8hKAuzFKENCdytC2CgkspdTClE3qoJgDKA0DhX+NT
	igSqdvRkkEAtghKnZsMWKyYEJiHJAmz2G7+YUHB4Rchn8hDAsO3BaRVltt/mveIh
	YroTGR8FTS4mzgkvGg2SBR7GTh86zi+cDOU8FEc3w0t3NtFGT77cqGSNo6Lx7TN0
	OGLFLmU0uv8/SX63TkaiMMBLsxJGk9n9WMExDRZ/tED1VqKXQJsUBE+iFwEAeYmM
	YVvRGtZ0V4AGs1iSBR1pYw97ctU0VS1xbRPv51XDTnUoAwhcxsRNEolVbmEZL48f
	3gKABA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8hjgv99q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 03:15:18 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d52734fc41so86405565ad.1
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 20:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787627717; x=1788232517; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zw9BJ9wTlK9G8KvdBmOSxdt0qW2SYtUaRVnoZ3uGJ3I=;
        b=Mg2Vc9iwQ7+94JOcSN0TWLX0K+ImQdLBmxQWHDGGS1I7QhJiX5oy5JLgSgJJThgka+
         vGbZiaF3MDgq2K/1g072x+qIcXq9o5YOjl7Ju/AK+j88GMckxfVMajaET6Qrs779o/6w
         O1t3wy5XMyS1J+1d1kTcE4mozhPz88eGN59VyNiwloRcEGPOhRBhmZudoOMcAVPuTxnP
         YyWSyN9QxjcWR19UhbCJ5hW2cFqVvMw7BXovz1MH45O/Rx43IwZXXQiQjKab/ris5h+5
         9liPqcqxuWZWUiz04a5eXCnPGslr8nQBdAVc5LIFZ1N5yma2YUeW+1PO1aqkQniHnjeM
         HAAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787627717; x=1788232517;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zw9BJ9wTlK9G8KvdBmOSxdt0qW2SYtUaRVnoZ3uGJ3I=;
        b=oYATgs+24YW86yku+1JiOP5TohfgUSmKPHKKdWUz52xmqpAb/vT5LD7SxMP3guD9H0
         UmYVqPkUvqMNAfRLpAWrHTYUw6jllcMeO817MCdYZ/T+N2chlQQN+NW6Ylhnqddr1gB8
         XuLj3rvbnvAdy67bISOLLEqW4dsa6EkuezqtukIgdc8yKs8YdvUzCXNvDC9cvjcYDX+v
         iQhw2y8mX8Ir4lp7BPCr8VSsPscV6dOXv6OMPXrBOyq2SJm7mn9eGMcC7J20wAPyxPj8
         I/B4nQezqmuN6fpe95taKr6i0neWcJgDxKgtSIU7Xn+kEyrOWYXkjRERNpUDYrLpgjtP
         AosA==
X-Forwarded-Encrypted: i=1; AHgh+Rp9l3kcEtmis8dcyUz6QojYHDWs5ZgoVyyO5scAVWgH1tkZcLWkdfRI5HU2VAi+7XxjaEIAP05PLsWP@vger.kernel.org
X-Gm-Message-State: AFuF++mpo8yE9ZAIfPTnt+IEsReBAeEPx9QZnjo3HcLLxDFLP/N5aGLa
	SWmlo/2pqibumwOw4aIlCXQHBM11GsKHk+1zekP5jvS9rLXdW3RfqlQ4b1N+PF8XlJkZtInfKAn
	BTtnvKlOdg+ybkNNZlBvx5mR9l/WdzXxtQssjhv8rTyKignxDmU6yUavCl0kFUyz0
X-Gm-Gg: AR+sD115z/pkIRG4vcabrzfCgMezTt/VcIqcR3cCaMI7If6fo3gOvtc4nvuKlCgorFy
	WZD1NhtcxUHRM2CH4udCvJGa77odCDwDD2pPjSKGECnBBVOAiSrWH+x0AcR6yG0TsLSo9ijPAOV
	7usdaRtE5Ds4XOpxijR5LNCzLusBdsTid3o3BuFtchj/yJ2w5ICAraBAn1oacdop/udehCDT+Xh
	sFY8YZuDvTvgRkCAQex87NSWW0VEszaVOOlHKhZ4Bodb4eLKeGeeboCUU2adwLR3a9tSvce49kQ
	gKm62pLKoeo0petyIo69hpezE4+GX9WywwuZppAbWtvcekjoR0GXtC0Bjg4WpdvIMEd7cdu+BV7
	2+sYnXuZXYdgYB2LmK9iAZM6jpcT5Ew==
X-Received: by 2002:a17:902:fc46:b0:2d6:dfa7:fad4 with SMTP id d9443c01a7336-2d6dfa7ff18mr60428205ad.0.1787627717490;
        Mon, 24 Aug 2026 20:15:17 -0700 (PDT)
X-Received: by 2002:a17:902:fc46:b0:2d6:dfa7:fad4 with SMTP id d9443c01a7336-2d6dfa7ff18mr60427295ad.0.1787627717013;
        Mon, 24 Aug 2026 20:15:17 -0700 (PDT)
Received: from [192.168.1.132] ([70.95.199.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32801d7f812sm28570652eec.1.2026.08.24.20.15.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 20:15:16 -0700 (PDT)
Message-ID: <502df11d-c372-445d-99a8-512fdb0e9a4c@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 20:15:14 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/9] usb: misc: qcom_eud: add per-path role switch
 support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Peter Chen
 <peter.chen@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260811213610.2956147-1-elson.serrao@oss.qualcomm.com>
 <20260811213610.2956147-5-elson.serrao@oss.qualcomm.com>
 <c0215cd9-3973-4306-85e9-d58674d6bc83@oss.qualcomm.com>
Content-Language: en-US
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
In-Reply-To: <c0215cd9-3973-4306-85e9-d58674d6bc83@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDAyNCBTYWx0ZWRfX1bc0l/EViccb
 aX7yLB+fVI1P8FlOa2Dt/FHRdA5QLac3HHxc2PmA51oQ8Frha/MAUabf3bMLWl4pxCytmyo975h
 tMZM2YsECLngvCrETnMpD9OHyDQPsF8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDAyNCBTYWx0ZWRfX2ap6KOUUuSBY
 KB9YIJiBNWUtUQeufjmp8swKEm0DlBmp9e02JdthdklOgE/V97Drcq5+fTaTy5KFwIlQLx67J+F
 pYpMx8q2ZOsEjzLacgPzXiTttqMeUuJ2PD7hiIpcGfwB6jxeFqAyBBo1qKpCDI9MLOmIpHTFQj4
 /bxZQqZ8hZVJFhG7XvRlq43VOcYmMDGRZwDwYtQvJJPpIwSVKQxVCXtNG3F5jsO3YPuTWNC12Ze
 CupM6W3aEfe07yqGtYYapePNuUV8qhUIMoCgk2takL/5GeTmeHJdVu8o2MIRgQ99Msm6O/NxAf/
 VBRilnNhgHVZRUcBp1B4nZA9VeErlyKB/fEj9GsXcLNw0JEUPa0R3om2IS+p5F3AHHr9oxbmuqf
 hI5VOdmub030zEKqRe64gp3f54bYQJ9B4ctGZ5fnMUwtNiY3SzcwyxmfsGht2khDlycbqmo7M2H
 HhMw7WL9IsFmv0HvZWQ==
X-Proofpoint-ORIG-GUID: 6OG36X2bODNfhv2YOww3J5Q8xZ4X85aa
X-Authority-Analysis: v=2.4 cv=CoCPtH4D c=1 sm=1 tr=0 ts=6a8d08c6 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=uHxescsG3rBdxcXwcPaeSg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=L8Mv0my-441DvGKMhw0A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 6OG36X2bODNfhv2YOww3J5Q8xZ4X85aa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250024



On 8/24/2026 6:44 AM, Konrad Dybcio wrote:
> On 8/11/26 11:36 PM, Elson Serrao wrote:
>> The EUD hardware can support multiple High-Speed USB paths, each connected
>> to different USB controllers. The current implementation uses a single
>> chip-level role switch, which cannot properly handle multi-path
>> configurations where each path needs independent role management. Since
>> EUD is physically present between the USB connector and the controller,
>> it should also relay the role change requests from the connector.
> 
> [...]
> 
>> +	if (!strcmp(dr_mode, "host"))
>> +		path->curr_role = USB_ROLE_HOST;
>> +	else if (!strcmp(dr_mode, "peripheral"))
>> +		path->curr_role = USB_ROLE_DEVICE;
>> +	else
>> +		path->curr_role = USB_ROLE_NONE;
>> +
>> +	/* No role switch needed for fixed role controllers */
>> +	if (path->curr_role != USB_ROLE_NONE) {
>> +		of_node_put(controller_node);
>> +		return 0;
>> +	}
> 
> IIUC think this is a bit of a convoluted way intending to say:
> 
> if dr_mode != effectively_otg
> 	return
> 
> I don't think there's much of a better choice in APIs here, so let's
> maybe just do something like:
> 
> if (host || peripheral)
> 	return 0;
> 
> directly (i.e. without making ROLE_NONE the "desired case" as that
> is very much not obvious)
> 

Sure. I will change this in v7

Thanks
Elson

