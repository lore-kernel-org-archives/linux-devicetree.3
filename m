Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A03429CEC
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 13:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787579085; cv=none; b=oq9EPVQdKFzFPwgcPIzPlohOB4Muvu1b7sx7SKGqsypaE6WFTxA7EYj/lRehhVraTB+TIUMtI/6UbMkO0vzhzYub4KY+hHxYxn60G+crF6EQII7cObzbC1JlU6Sq9NrX4M2Q6pOy+MNlJL8jFjFKXsSr+rLlRSv6wfyzQVYMrno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787579085; c=relaxed/simple;
	bh=hv/JP8KtSbG5GQgDD9yQqGtkwO9PPFQFjzg9Nd11E1U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=totLdkmUs5pejdIYJ6EcRZSFw+qNbBZLRm8daHGZGEyCoAWHoAm2YCRpl8MNPfq0wHwCS53TT+3ZGQYWoRNT+wUTZipYAPcsuX/7pkFJsdDQV5x92dTuuHY8hwucYUZ8FUx0vTKdVuGZkdo+d+2vnqB9+OuuyBDuXZ2BKlNXVBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KwwZxt21; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h8r0Zoaj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KwwZxt21";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h8r0Zoaj"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OCvVb72579746
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 13:44:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LacD9V3RBfY2cXXFYkLOfiCCuGzuDZ67e0ihEQlRc8c=; b=KwwZxt21D3myEBAm
	7DSZX8i8f0fMaPlwsDRkV8fx9kZ2ZROElB13OvNg4neVfR4vswEuzbtke7fOs0JZ
	GcgCVqqzDEPprFEGJCfXkZXjYw99FdivGdY6ZGOeJgYD4JpUOLzLarWYuwYu5smB
	zAsCj2DCR56DyLGV/CL9OaPK59bYAD1ov/nbXd1Ji4ss3cTuKOS90wWT044pYWpg
	mtCnaNt6RHKGDsYjGIC9Y/Sf8RAGsW+beqGyIfRpX7arTWj4BjxL8YIiDk/Io1Jy
	GE9HH+aFvTI3sWxh6IHNkvltdPsPGtaQ8YBFR366fypckhMla48UUZp9R+J71KlL
	Pt4VUA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8gdshww3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 13:44:38 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-97c957141f3so15813241.2
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787579078; x=1788183878; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LacD9V3RBfY2cXXFYkLOfiCCuGzuDZ67e0ihEQlRc8c=;
        b=h8r0Zoajedv9kyh+8ujt38E3Neti5hAd9/HCNHJDc8dDj3ikzVaY4Lb2qYtbEbb1O8
         4v+dJz1qMIIAlYghieb4zhUwGWDTIJlssIpadbFaqk0OazdK6hiYkvAGisc2iNGDHAJG
         sJO7fBsHr42/OQtiMRyqXMEUn9pYd5jH3ShoSzd1CYdlFimqm+MKW7F5Sj8E8+qmkGxM
         6eZU8sCRclJOndeZWhbGWo0S6g2Rq2Tk4LrLaj8WziUopOxFh0CklDul7PfNGShlbM0O
         4XHOFeD6hrhpdc5qC2zq4MZJ5/WLSzMgIoFhiNMb6O0YZ30Ywf6TBMI+lUY4N361mHfw
         hyMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787579078; x=1788183878;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LacD9V3RBfY2cXXFYkLOfiCCuGzuDZ67e0ihEQlRc8c=;
        b=rI1ZOvGN2xxbEr14MTze05veQF/fRz8/it8Grm5sO7lAxQQW6UbIgznChQB/+p8whc
         uGddGwO4tBkxarwk07BIgsKJVEr0pdSvCO1KOX2R7Lfx0kMZeAZAp5GVBprn/FXxi74L
         PUmHR+H+qm7m2ZT/NkbLgB1WbiV/hBvPcU5lH8BDHBX2YdkfVXYqq8tlR5ae46jTK10J
         /kTeGjU926uWrp+s/PtxuvigZGt69/Y4lVHtqSvib5HF2jL9tRpEwwniBtXF5AzU5Hx5
         MxMpRGa17uPZGrKjhr0WZLdLX0qDZ6Q2QFCYfQIlxLT8gWaQ6jYNgLzmsMHEFbvwh+cR
         ywvA==
X-Forwarded-Encrypted: i=1; AHgh+RoqwwlMLCKJhljlrplk/LdeD9g7c2lrS/zN0+cuAIiF5xYCLxaswE2LFNsooJWB1fXxcbSvlns0YYhK@vger.kernel.org
X-Gm-Message-State: AFuF++nWViXKPLdxnOOpS6B7vfeJjr2DDBFG8DxOQnJQ0UvGtLhnyR88
	JU+sHmz8SKk08EsK7C4wEqMYoYHmYIC0mtJ8rPy1VE7fQvk0fj57pVucos6WIlD6Rgr6M96erqA
	dPA62MxtE0ypi2fiyshrOlWLzfSi3FSAufn6VAPCX1mQQltUgYIdxsq9SK7p7N4sp
X-Gm-Gg: AR+sD13Jj7Lg7vpQic8+D6OLd3BE3o/u//7FoS0Xmss5fZvHT6ScB5dUVifN78BQThN
	lwDHIhmkBGk8aahF8f3PH3uF9rnzRICwgL/vE+rRY2+XNQ54u27Ix8y8SjCnU0NxKYgcbVhGCMk
	bYtoyLO7rG17XfvJzj1NJ56xUYCoQlVDzYs93jsbc2dbl8kunS29KUNGIGwMzMogwVue72HN7/n
	C3B131V0JCfihQCJi69egBKbWh5VxMNvt6aghrDfAqzhFj2Lq7Tphy3LDMHnhEzDxOvPfo3nFOu
	XTmjwQniFqI5wPnsI59U3q2lmsp38p11UKWCyds6U1VBuMSmuOLZRBrBB0ib5YO+zilv5md1Z81
	OhUPPi06z/7bD7w0a1g/OoIIW
X-Received: by 2002:a05:6102:f90:b0:779:7d3b:1398 with SMTP id ada2fe7eead31-77a5edee8a5mr3943901137.0.1787579077832;
        Mon, 24 Aug 2026 06:44:37 -0700 (PDT)
X-Received: by 2002:a05:6102:f90:b0:779:7d3b:1398 with SMTP id ada2fe7eead31-77a5edee8a5mr3943880137.0.1787579077333;
        Mon, 24 Aug 2026 06:44:37 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e1aeab9sm10043455a12.22.2026.08.24.06.44.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 06:44:36 -0700 (PDT)
Message-ID: <c0215cd9-3973-4306-85e9-d58674d6bc83@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 15:44:33 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/9] usb: misc: qcom_eud: add per-path role switch
 support
To: Elson Serrao <elson.serrao@oss.qualcomm.com>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260811213610.2956147-5-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: I2EwkH08GcktuVptQ3xo2mYMzFa-SHhn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDExNSBTYWx0ZWRfX2ItptTZTZ91h
 XkuczJZcdrpWzYh7sl9Dp8ZkG6ygOIysU1dM2eCU6K8kyZur89GR1dfELpSaqFSrZK2JrS6oQSW
 YFtGV0X+Bo/xFCOqV31+7pV+XI7hxerM2yjyb3FmZfjqtnhlbRyOTF52Dez6mhMlDPmlL9VwP03
 WgtZUYvJZ2sdMbZrVvVaKkZBaZYyQ/ROxpfJv38oha+K4zNtKVI8GkSKR9EMPBgdPXuwri2Eg3p
 DMTIViq8ff2gzBDxFS4TFZnlO650sSvR57fTuYUMJ8stxAlojUEwHaZF5n9C0Grv51y3SM5htF1
 sE7PgIfagWRXyRHfQply8CxLZEYVn9Tx5z1wMYGHV0QpwdUYx2hZzRWaXD4Ig4v2p5rvmu4yZ+v
 t2MyH5t3DdbaOV5KUFGG2WN/4FfODjHOIrFQSshrgEQCb8GCHLvHGcNj86jLdVgBtGcG1lPlp37
 BDcK2quz+xXiWqhsdrw==
X-Authority-Analysis: v=2.4 cv=Fqo1OWrq c=1 sm=1 tr=0 ts=6a8c4ac6 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=zBKxk7NNTVBP4RM8Aw0A:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: I2EwkH08GcktuVptQ3xo2mYMzFa-SHhn
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDExNSBTYWx0ZWRfXwxukywFYvh1s
 l+jD9/i8s4QGfts4jjGy2zMZogdH/L+t83JIJK7bk3NMrr+KcSfRcO2nPMFT//+WVZ7Q9GO4us5
 gMR8rahqPvspGqPiIPmKHwpqapI1oN8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240115

On 8/11/26 11:36 PM, Elson Serrao wrote:
> The EUD hardware can support multiple High-Speed USB paths, each connected
> to different USB controllers. The current implementation uses a single
> chip-level role switch, which cannot properly handle multi-path
> configurations where each path needs independent role management. Since
> EUD is physically present between the USB connector and the controller,
> it should also relay the role change requests from the connector.

[...]

> +	if (!strcmp(dr_mode, "host"))
> +		path->curr_role = USB_ROLE_HOST;
> +	else if (!strcmp(dr_mode, "peripheral"))
> +		path->curr_role = USB_ROLE_DEVICE;
> +	else
> +		path->curr_role = USB_ROLE_NONE;
> +
> +	/* No role switch needed for fixed role controllers */
> +	if (path->curr_role != USB_ROLE_NONE) {
> +		of_node_put(controller_node);
> +		return 0;
> +	}

IIUC think this is a bit of a convoluted way intending to say:

if dr_mode != effectively_otg
	return

I don't think there's much of a better choice in APIs here, so let's
maybe just do something like:

if (host || peripheral)
	return 0;

directly (i.e. without making ROLE_NONE the "desired case" as that
is very much not obvious)

Konrad
