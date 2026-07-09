Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AF44DB566
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 17:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783618725; cv=none; b=fmqLglc8m1igzyRIhB35p+7TSfdxZa4ihhzAXt+kOCw3RlH5lwNchR6jtMGX4K2jBF3MaR2sZadAL5TOC5mBhgFJKLBVb/t957IiNFmOF2NvBVU0+/lNcOCMWNex+W6b/x76zUm2R2xcJQughBtd6nPwYK6u3DYRKO/jtXhVCHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783618725; c=relaxed/simple;
	bh=4UXEbyORcAwHgjjDR4JOOURNBg21vbzMhO1OXYbnUSs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MFQSy7t4knaVL//dXrtvUmhiDqvzDkqzf9lxe/UkztkIXyapim/y2yqBXM5uAoVwaACTxDawrt+/LdFjxDxYl60K2y9jSxQa9jD+Axck90NZ8xeb6LnVeL8JWb8xskyTu1sums+/L9jPgOgS4QncseR4Iza217wlRnaoKNTgww0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MaikMcD5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VFqrw6x5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MaikMcD5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VFqrw6x5"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HY38U2520612
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 17:38:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rK6187T3L9xvdfST0RXOQYMxi/4Wqewcyoc6MgC7GX4=; b=MaikMcD5LMptoWoK
	o9ZlWXVxRCpuuHmpFHHIDu0BPePzq/N890bhlofI6JD4ZWQmepq7CJLKuU7jKJ8E
	iSosRe8EnP4ugIY5dXs8sPvt8w8Wq4+6y7dHCviw3GdUR+DxDjVd64+fhtqf9NUx
	ACNUqfeVLWUH6pcGYZ1K/SqDRALHw7QrQQT2ZgIiRQxIZfo8Qo2C+JhIM0R9WKqV
	gZ+ssw0jDSRuqibMD3v3C/GkDUm7XbkvLZwpjHok0PfUsjbuHwec5bud5/iDkO2r
	dNus4WSUGWCJFcmcN5MzPHOaWNCJNsAkuq5uLyVpuyFCcNJFVEbC/SOgGmYT3czV
	1gNy1A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faekn8mns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 17:38:43 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8eac2620cb0so1970356d6.3
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 10:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783618723; x=1784223523; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rK6187T3L9xvdfST0RXOQYMxi/4Wqewcyoc6MgC7GX4=;
        b=VFqrw6x52DjT3iqc1j1V9jEMr3oclE5d+WWqA62zXuM4dfBkibRumlbSGuXljOMirP
         8SKphL1qosr6UAeOzr6JGc3Q63+02hGev6jAgx1hJD40vDxtaRRYRl9OqcTRkTucSAih
         mk+exwW+JTMifTU1P62pDCOVXHjGbE1y5CuxMrpGLWW+knycG3kNDj/mh8ss7TOKWRa+
         6HT2y9X6wTK21e4VeBExmtABD+Pyn1oZnoAWMzYceH13zysU1xW6PvQdllkvTy+xY+4H
         ALL6HQCJhHdRdW+GcHEewjjQOzBa47m2mE8SP8ZTEuN9gp9EWccfdcrPfE7G3vtsXNs3
         Uz0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783618723; x=1784223523;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rK6187T3L9xvdfST0RXOQYMxi/4Wqewcyoc6MgC7GX4=;
        b=gGzf80MkQx03RyElSAWtTHESsync5eWU6r0zDGQgF2D5+aMgGD+4o99Thi3e4Fqa+z
         hzR28KabW0wf0Gq9CImuv9MJ5VZ06VywASEYHebvL8lOPGOBKXpcxi6Mii9NY/uiEFD9
         +puuRUullPQr/dmZc9o7Lu+jJV/BOb5LGFk+A9HHz3utP8gSJNFqVWFuq2A7ZeGSznVX
         ksU/HzrhuZz2D/D9N1AFnWSlpQiLaAO+ccy4Lj/wZAEU0+Wih3htdzm8+s5+5tKPjfeE
         G7Kl29mR0ChW3RSi/KMvL7w9C55EOVZSfaU/lrjFTdQ3ExXhsIi7dYeBJMCoO+k8tj5T
         K5mQ==
X-Gm-Message-State: AOJu0YzwAsuz/G+5F3a8Q/zF5yflreXcwwQeNtkKxnJdYRYLhg+sahJf
	UhSeDag8CuPdhLS6YQfm3MYWqj6rc4GVysYVom+BSqCRCzqSG6Gy3S8uZoxE2NJfSH1OfqG3uVj
	qIVuTOt86KCrkhZdg1ofhVAyUWpvESce1gtPekQaQj5MfANF9JZMZeQTtUmrAzWnJKfR5Vr9w
X-Gm-Gg: AfdE7clTrPl4y+/eKMdCMWkiTIB4nMYL11MyR/Z1H3nouLFe1+NgIgDdh33naklJ+BF
	f71J4S6Q7zJ61neph2/JwnFHf2GBl2RySuqL+I8Zc6A73L++aWFS2kVN/nVT/swr5Rq4ReULZ8k
	ipZDg6lo+XDXI5+fzOCDVcTP+As7pr6a/qeQHP8wgjr67AAJgm9fotd7SVRVrF/7625FTdnyaOk
	Un/YSl75why3FhTH9uFvONy9//cEAYog+P26aa3mzIgsfqHGHBRr6rZZt+cfY0Jv/dMZR/WxlgM
	+w4gWZKozS1LPRs8/1LebNQSEULY/5yS7N337s+bjii6MUVE3imcV9V+HFnQsg0OGcIV3BHzpm+
	OI3FLrH0+NEpRFCvPhI4BdVLssg7KhPkzirAXyF4=
X-Received: by 2002:ac8:610e:0:b0:51b:fcb4:7576 with SMTP id d75a77b69052e-51c8b2bb8afmr95940991cf.15.1783618722547;
        Thu, 09 Jul 2026 10:38:42 -0700 (PDT)
X-Received: by 2002:ac8:610e:0:b0:51b:fcb4:7576 with SMTP id d75a77b69052e-51c8b2bb8afmr95940041cf.15.1783618720815;
        Thu, 09 Jul 2026 10:38:40 -0700 (PDT)
Received: from [10.204.141.154] ([213.55.184.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1e6ccsm53200522f8f.5.2026.07.09.10.38.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 10:38:39 -0700 (PDT)
Message-ID: <f94dee2d-1f2e-41c0-9335-daa6bbaa1042@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 19:24:08 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] dtc: dt-check-style: Allow space-aligning
 indentation in DTS
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
References: <20260708-dts-style-checker-v4-0-c175e6401150@oss.qualcomm.com>
 <20260708-dts-style-checker-v4-2-c175e6401150@oss.qualcomm.com>
 <20260708145005.5B69A1F000E9@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260708145005.5B69A1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE3NCBTYWx0ZWRfX/zicSkf9S4Wa
 /KgOxUWMkJTqLw0if3I1nyONQzkk3ysoy/7QnIFwwURpZCZb9m0nJFgd+rkgQy9kCBvDO/Pj4jd
 Gadx0cOLQGtnIawG6UvTtwERTBYhP8k=
X-Authority-Analysis: v=2.4 cv=SNlykuvH c=1 sm=1 tr=0 ts=6a4fdca3 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=nvVmADDuAioZMzk/ZEnfEw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=9ZkQsALANqwWZhioCQMA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: Nre3mAJXYsDAsWbsjFSuyoHlfkkNP1RX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE3NCBTYWx0ZWRfX9h+tiHsoCHxJ
 M7cHMpFx/rycHcYkFXeAViHf8gsItjMA4doDNiu+s5MO0n1zDf19Ks+2rKRXyTNvXXrOTsdPeoD
 t3FgKure9ptDJiGf+rPd2od6RQglPBl5hCgZkgzkXqD99eSEmz0JY8kBhCymbI2CDWSEsdz8DFC
 6HgiAdKy1HOT+LDX+GBr66cbBETFmYwYoYR9KrY0LtKArvphB4n0rvk60wMEZV5jtmL118EwCKy
 5MJkcoyVpwJm12bxST3ZXNC8tBG1AZp2wQFkYZU6rCdoY6WJNAnV0NqcZvJgf1bh8w1+OkME57B
 86aK9PlhFiTSwSZsRtH+/74Iftxw4K0CbZ7dYZEgCD5KLwUaPv2VKNMqT/OGNK5cr7SaJ39pwCh
 CEkIcLhxAAMTNG7Kc6//IfKl8eeF9XSt7KXlZ7Wi7CfvEgx20CWdCUNIgiYyCJKAD0K6VzDEz+7
 8ir6M17Rj7F8OeFrBvg==
X-Proofpoint-ORIG-GUID: Nre3mAJXYsDAsWbsjFSuyoHlfkkNP1RX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090174

On 08/07/2026 16:50, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The `check_mixed_indent_chars` rule silently bypasses property continuation lines, rendering its newly added space-limit validation ineffective for list properties and undermining the patch's stated goal.
> --
> 

Ack.

Best regards,
Krzysztof
