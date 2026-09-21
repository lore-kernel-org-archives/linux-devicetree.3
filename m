Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D521499F3D
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 12:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789994175; cv=none; b=uWPK0As8LJhtg8q6HdsD/wS0/9d0cxY3LozVJ1ZGL9lJTSDCG7RGCGRTAmMhciP0HzN/diHoADHq7Bt98UktVdg9a96+WQqtHjRKuMCS7yHa6THP6CwpZ1a+cHIwO/p514EfFrQmv5rZ8qmQfhY5PKCyQGF3KPuzPiAbUjx/0AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789994175; c=relaxed/simple;
	bh=Q8tNA+Ne53BbQbai86auz3nmCKdXWW4PmWnHJ8YV9OM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SD0X/LXIgdS7A5vfwpXulqjtuAsNXRe9uV8SFXWenXjXjy1s6is9ZEwpkG8MNp/Z1UtG63OMqGMmEaHSyBln8AOhz4GowD6Mt1iWHwcdxzenu7AO46w0UFdwpWvvBttey5bgs5F0mi4b+as7kzZuuvMkoISmpKuCWYtXD8S+YoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AlU7nzRD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c29cCu7p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AlU7nzRD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c29cCu7p"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAe2D1934391
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 12:36:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BBdHXbwhj7x/KyZpkT+o8a5XuFk7ieS359+BRQZhQcU=; b=AlU7nzRDBpSSuNix
	eb0wQsDhnrHeBvnGbnQoHxGgITZOsjx29VgEXZtQK4n9DhTCoHVCYVlLm4ljUmiB
	S6Vn2NMHZTfu4LWeu8f5Qw3o34ThbnEY1JRzndM1cqRtxj4kY0cg8C8bfwQO4qMB
	VnVeuOrc5HxMDmcrk1lVds5r4hML/B0fug/5+8nO8hUm50MKRBMKpY0tnNBcQHcR
	lLx3QhrWVXOqgtCsw8STV+Zd8A7TTGa5nSMOqWQc1rsLeKMd3mrktcWGIMRiRN3q
	/ZYbAstFIi9pY8KwBPl98ijK5c3DBbGC1G6VxC3Yb6qIfyzB9+Ae77SkBIRCTi6v
	ezt6CA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtq8bam9v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 12:36:07 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c7d6767d06so94789e0c.2
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 05:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789994166; x=1790598966; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BBdHXbwhj7x/KyZpkT+o8a5XuFk7ieS359+BRQZhQcU=;
        b=c29cCu7plzFMXI84fgzpbi4MJ/+boqAHIcB6oPmv86gtSSGiaZcDrAWFcsHhwsO1bK
         3YQutn3QCOGDKO660OE6++AYYF7zPyy3/I/qgt0piLHZ7z26+1/3zIhWxUeNLoVSvVIZ
         UmaY06rGToXmF7Nb6JLa3bnG8e8WmRLujO3I7vX58mizHJWITdhJ2LdOGr/br+elqdsm
         YBCMKV95Xm6PxsI4ac5s3yec+7BWJAgF/cBAsW3VSDQm47UWzBnrpvxGgfd1DJ1fqObJ
         dZH5uoRoWmcaTENyiixbz/hldiP1byA2jrOfFoFjVwF+BFf+8fOk6fHibyFSbTLZpF/M
         RMpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789994166; x=1790598966;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BBdHXbwhj7x/KyZpkT+o8a5XuFk7ieS359+BRQZhQcU=;
        b=Lzcb0Y4660Ev7fmSQ1lIss3EGFnF44nVEU0W++IMpM2+/wwwvXxhPAXazOTZu+IV0m
         7UWfY1186ygiRkmZw/YzTCsZ5uc6y5tkBQR+wLU+WApm4uFUn8uJdU84w2XCV165PyLw
         zJV2BTYTYiKHLZEZTgiGlRPR/PNDbkntVjjOfRXGd7+y+mrKHIGwpHO7e5bhnsN3vuv6
         MRjwUhuZwz8aI07bcWYF7+AO6PCNupSMXE/DAVTM/lxZ/5CqR4fB4/Vj3zewCVsQATEu
         P0MZGu62AFVZ2usAcBLFmd8sOQNjSUmi6mLlgdt6PglZyh/wcM8K4Lz8OHljSkfPnJkO
         tjMw==
X-Forwarded-Encrypted: i=1; AKwUvBzJ1lTtHumhtYtUlQQFQZNjQWUQhu3h7MB3ld2j7+3jtBctekLP2CdZ2ifZASoRg0o9DiKcOawpk3mX@vger.kernel.org
X-Gm-Message-State: AFuF++m8bbpbpWK+QVhkbinfvcV1wRqR/6sAkLGQH2QPhvTZv5D9qFVx
	6Bj8Y5S3vOXRH0dOl0KFZ4Wh59REYLGbkxH5u+uzQouivyXyuY8qto4JojfSIBTpFyzXWEua6f/
	URBgmuP9k4eGW6QoEbfZzKdJpmElXoD+8voO4P25ZvbwuRFOop+WwhlkcMxytCfa7
X-Gm-Gg: AYBFou08e/y301p+Es/sNZnYM7EacKoF6zgijATStjKzhMZI3OxiEUVC0l4syBfnHyt
	NbeHpeCSvXOOuA79EbSQykOLGcGE1IFZI1RNXpjFb0tCVzx/chCInYb2bZkB8D+1Zc3aipulrWs
	JufAl9JMCgZcv2hEHzoPtBcJ0hViDD3IE+Wgbv0TZAaoCl8WeI52ioM8fKPdSms79EX5rEXKr9e
	T5EiU7ojhry92TXt0ZAZdfITQiLklA88eTh6ZE3/hl9oxVviAmoWeK8Oq4GBVFZ2q0W4dbTMkeN
	IKPDwvAHo6ntHldIrObKtnii5dVqO/CpcAcSsGKrAlU0AE+RS20SExtqqiVk6ApqduuVN0g0r3d
	a15y+80tzTWO3s9JN1GcOAw==
X-Received: by 2002:ac5:cdb2:0:b0:5c6:2128:7cf8 with SMTP id 71dfb90a1353d-5c9b8b8280amr3310883e0c.3.1789994166551;
        Mon, 21 Sep 2026 05:36:06 -0700 (PDT)
X-Received: by 2002:ac5:cdb2:0:b0:5c6:2128:7cf8 with SMTP id 71dfb90a1353d-5c9b8b8280amr3310850e0c.3.1789994166135;
        Mon, 21 Sep 2026 05:36:06 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8c7943e8csm1941019e87.30.2026.09.21.05.36.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 05:36:05 -0700 (PDT)
Message-ID: <6495b9d1-fbf1-4ab2-bbb7-2ea20e82a1e2@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 14:36:02 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/8] usb: misc: qcom_eud: add per-path role switch
 support
To: Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Chen <peter.chen@kernel.org>
References: <20260831030147.1500616-1-elson.serrao@oss.qualcomm.com>
 <20260831030147.1500616-5-elson.serrao@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260831030147.1500616-5-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE4MiBTYWx0ZWRfXzbCx6Jtq3JuT
 q8do4kh9DgeonnMszoaNe03IqAw0heGOFg6H0ZDuEfE2JsWs7+pZXIWt07sOmTAHAt4qU2/e2Cq
 rrp3ihnPkMH7mEZtSSSpW1udY/+qHAQAOYzfkrZtu4Kl9142UQkDhlTQ+RD7Nm9z2YHuATVvz1z
 vdj3p/rtv2TMrJWcohSPzYWmk9OpfCiigkv8HDcSWhbo8ldhcXXgnUl/ZtqZ09yhqjwYmmJxrlK
 BpIm5ygYASAgr7o0iLBEKZQ2nSWwsZptFICS8m3XJmmEF+d6J9e8k4SjpWjc6upH+ITEgZNumID
 6HND+j+9wHu2uPcQfVr7TbRB37uPDpQzQwb8s+oCdgvh7SZhHrdIyEecRqTuWmX9D3Hv4K5MQW0
 s0PF9pTye1Y4WcedwjBs7JvSinaMx6iWgujnWLU6s34pPVjfhyIA6ScUPM9Sc0gbifsBs/Fxynn
 W0eGxifNDwIueTD5rmg==
X-Proofpoint-GUID: KNvUC1LzOp6DleeKPfJ3F8_rEpzNQfWi
X-Authority-Analysis: v=2.4 cv=T/8Z3PKQ c=1 sm=1 tr=0 ts=6ab124b7 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=XKJJLf0VuBcF_oTi_k8A:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: KNvUC1LzOp6DleeKPfJ3F8_rEpzNQfWi
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE4MiBTYWx0ZWRfX9oSRGrvuHi5J
 js9C+/fR6bU/e28LtlDg5l9L6sUuphsII55ylpFRlB+mFCvAYGyszJ3xmnDX9uVlWE5YtR5uVDL
 bHre7+A91uc4C7drXnJtxyRt2yt0ans=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210182

On 8/31/26 5:01 AM, Elson Serrao wrote:
> The EUD hardware can support multiple High-Speed USB paths, each connected
> to different USB controllers. The current implementation uses a single
> chip-level role switch, which cannot properly handle multi-path
> configurations where each path needs independent role management. Since
> EUD is physically present between the USB connector and the controller,
> it should also relay the role change requests from the connector.
> 
> Restructure the driver to support per-path role switches and remove the
> chip-level role switch. Additionally, as EUD need not modify the USB
> role upon enabling, remove the unnecessary role switch call from
> enable_eud().
> 
> Reviewed-by: Peter Chen <peter.chen@kernel.org>
> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
> ---

[...]

> +	of_property_read_string(controller_node, "dr_mode", &dr_mode);
> +
> +	/* No role switch needed for fixed role controllers */
> +	if (!strcmp(dr_mode, "host")) {
> +		path->curr_role = USB_ROLE_HOST;
> +		of_node_put(controller_node);
> +		return 0;
> +	}
> +
> +	if (!strcmp(dr_mode, "peripheral")) {
> +		path->curr_role = USB_ROLE_DEVICE;
> +		of_node_put(controller_node);
> +		return 0;
> +	}

I was thinking.. wouldn't that also get rid of the virtual detach
functionality on fixed-role controllers?

dwc3 currently only registers a role_switch if it's in OTG mode,
but other drivers (such as dwc2) do it unconditionally - see

https://lore.kernel.org/linux-usb/8fabc049-7fdf-498a-a3ef-6f2570d510c8@oss.qualcomm.com/T/#u

if that's the reason, we can change the dwc3 driver to match
since the maintainer there expressed he wouldn't mind

Konrad
