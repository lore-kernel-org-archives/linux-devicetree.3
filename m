Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56881DA57
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 12:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785673332; cv=none; b=j3RNj5AThxfCw6nmbW3Qk0sFL38+lzvJq6vx1fwaJaVwROFxSjVado6U3jw+Kx5WIaTbXDbwexLMT048kr9KdJohFucEEjBiahOYnk5iI0p2FxkfSWJfah0nYX8uZOfWiIHaiMSDpVaJWI0ZVNxxAf2hemfZJxMVlgZa+839XD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785673332; c=relaxed/simple;
	bh=K0nDL6EsWOvbfxKiLuZODVM9eG5im/VYJt4qpOrIjFw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PiBxTiGykFAcwFr1jdKvRKwTQGsLKXeIJpyjzqOLWrqrQjmnR6RfQ9EGQ6oJpMiyLrbB17tz2vuEryUJWePrs2yTdk52wdtnEviJDyINQ4DihQGdnpdyrj41aVJG4yAvmY4NGyiwt+qMZ/LX5tc3Zx4VzaheBKeMnCSqa501ARA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e3FAJNqM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=STWlKRlg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e3FAJNqM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="STWlKRlg"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672BuppJ1588213
	for <devicetree@vger.kernel.org>; Sun, 2 Aug 2026 12:22:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K0nDL6EsWOvbfxKiLuZODVM9eG5im/VYJt4qpOrIjFw=; b=e3FAJNqMwSV9W3fK
	W3yAz8mp6y2b60b3upJZUfKr5DHnAo9/tpyg6VHk+fh4PSg9zPqwKz/XXF5UeyLi
	027CvOxW6VgRMDBatJWIY1dfGNH8NyRjcP/g/t7SIzfxdbMsNhekNleBIIlublMv
	t+tGgtSMSqyQzZqevN10sfaAwCpNMfMVpbl1HK1nLj2uNAehxsRFvdo7IwplhTFF
	1OOpuE4oo82Dj2myi77/RaXIR8lkHjqR+CZneiSDCVMDOu5gUQUv3bTvZ4R0qtqY
	cX582GUg7jdvabTjHfXSgoNQbKaCCI0/5GUZ9NkAA1ZnI/m2xc4E+viWQIfGm2K9
	9+Aquw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8r6ju0r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 12:22:09 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c0e702df8so25784441cf.2
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 05:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785673329; x=1786278129; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K0nDL6EsWOvbfxKiLuZODVM9eG5im/VYJt4qpOrIjFw=;
        b=STWlKRlgMDko6HrbpzLOrjMY7Lf4JM0QZf7JFkCjG+5+BstvE6j9wDz1FsS+M1oWIz
         x1sr1bSiktjZraoDfuVPTZftjUY11fCjyYrvT2BhnoqTp1r0Pd4HOlfOvQkGIIf7BsCB
         5bqXN+aH9i0LErW+v0LbeF+OrA1kZd+L2GNfbLXMQG5pEKn3819YDubMIAqvwbg/q51d
         GUadG2zKKWt2ejQTcu+l2AN+5BWTe3ec7aGg0yLCxfmeLJwj1Zzfz2rUMtreEFQQN2nr
         NbSMhplArxOQnbrtbpgLCANSbQW+26VXJVsI6w4x5ggFqm39bweRdjnxeb86xtHYyNuv
         TvgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785673329; x=1786278129;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K0nDL6EsWOvbfxKiLuZODVM9eG5im/VYJt4qpOrIjFw=;
        b=OmSPOHs5oDgAXp0ktp2vAIcyrQluwZg4lkW2bR/42yLyxOJtaHvqJRnMwmFhV/8aPE
         CWz8hVJg1ENLptMp05IZnE0e6PkvYx9Lj1QFSagexAhEuWxy+TRclK790zO7F0PEdShD
         8FiH9rp9s9EUW/6LJVujzaIvw2j6xlVAgPW7a4CegfmZmTQMbzApPoegByJG+70hLHtG
         otpRif8pewEpsl64IRH1XvMSGg5/C5VINrXPMvS1zhQXeOIfhxjUvH+A3n/Xl4H4RqJl
         pkQiJR7vT66CY5aq0IYZT97BMV4XbatbSkpnUf9JAcPMjMbS3ot2dHMdzO4Xf5NulzFC
         nmPA==
X-Forwarded-Encrypted: i=1; AHgh+RovG83j33mPpWEO1notPtIO+AtnXjm1kC2yDlxci35IX02dA+VjLbqg0BmeFmc4ivVae5DctMgx3nqg@vger.kernel.org
X-Gm-Message-State: AOJu0YyqfdR+nJPhUWSuNeZyXhcUDOWNadCysKBOybZcqZDa+tDM404g
	6awWBjRoe0sLgNTdQqvAQxfVHGsbp//q8L7EPdEacXKaYQUM7JOOMLjlX8cQ3T1DOmbzUuhddYk
	OhpCliopgkCB4ujGhqpqkPE3h3l13zYt9AiPWcLeatePPJxseiDpbr6ePjyC02RAvzHLfiMVB
X-Gm-Gg: AR+sD11IyXbJhNwughQKCWwgUYiWi+Zgry6QKrxi4pXuHgP1VAaOHzSpy0clRUitHpK
	kYdYMNimkhpPWoXFK2qpQp1doybsMJBDX7k8I7CByRFj5s60LVS8WnjnMMJR79GxqVJQDKat9bX
	Ugs30Qw1oSJg9XJQw/OwLQ60f0f4bjx5YfSk1mGG8cFkkEIQhGORuVhB8Z88IJodl54dZNU9OnX
	fr8Xhlwvm4LQYHDojHelDft5Qc5IlsJaA8bPkw3DZV22YYqdYu3lbUOazrGMYqd1OZXYMgWO0TA
	dkVeL4noNDZ/66AekuYojnQav568TWq+8VmgXMkbNCIFHLXock1Jt1esuF0siTJuhiedzNqxMOj
	z4CwmMtWE8CmfdcdirjYkNk6vV5zW+Q==
X-Received: by 2002:a05:622a:5145:b0:516:d955:ea6 with SMTP id d75a77b69052e-52b566afcc1mr136397421cf.14.1785673329156;
        Sun, 02 Aug 2026 05:22:09 -0700 (PDT)
X-Received: by 2002:a05:622a:5145:b0:516:d955:ea6 with SMTP id d75a77b69052e-52b566afcc1mr136396801cf.14.1785673328642;
        Sun, 02 Aug 2026 05:22:08 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41e2484sm24324765f8f.11.2026.08.02.05.22.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 05:22:07 -0700 (PDT)
Message-ID: <38dad4bb-c05d-4390-83c7-2cd0e76aaf4b@oss.qualcomm.com>
Date: Sun, 2 Aug 2026 14:22:05 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/11] dtc: dt-check-style: Consistently call 'kind' as
 'file_type'
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260802-n-dts-style-checker-continued-v2-0-6c5dbd1ccfe4@oss.qualcomm.com>
 <20260802-n-dts-style-checker-continued-v2-7-6c5dbd1ccfe4@oss.qualcomm.com>
 <20260802085405.8FEF81F00AC4@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260802085405.8FEF81F00AC4@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAyMDEwOCBTYWx0ZWRfXyVlkNe3hvFte
 EyzBAqjvEGj6oO3IRTJQCm+ZohhGwmGqoMoQDUiFKAQlIepDILFSTjAwpfnzPvM17sit86iwaO8
 mg1r2V4fBN/LWBsVUq+Fw2QSs3CdEQs=
X-Proofpoint-GUID: qDYfq8YwhosHGTokBYnZpq5wrgCLwM0A
X-Proofpoint-ORIG-GUID: qDYfq8YwhosHGTokBYnZpq5wrgCLwM0A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAyMDEwOCBTYWx0ZWRfX5P82+DALHaGf
 4RK/pfhjGlVl0UMemyFvD/CmUbyaA1zVvhGUV+v+cCUVIwV2uEAka/vQtfC4VPcXclcaDwwCnrL
 OSGjaH41vbvQTpRJd96+pdKQ9DUT4oWI1KV/U+ih+ErMgdIqKpm7L41JDGJdG6Pq4nxSQvpEomy
 HthBZAuFrEKvKIA1mK9dEYRq5Nte4gTK3cxx5seXbow7l2Bq5vxMXIs7kRXO3rVMfy7JhoqnbQt
 LwFa+qGeFLxM1gBFYQZsyQcxVMwveaGFhOj9KYeeylUAWbNjeUII5DMfvhtxJbFQbAdWClisw5p
 IvMig21YzgKcC3bkIGAwPX49pZBtm8G7W1vO3LaYER0clZdIv57FWmCpH6n9WZAYKkY761mThAR
 5MXZt8x0RFKVFMvBwD1EYD93H9KgrS3FZ7vfO9epJdtMnuym12okZIAgT5EIPsq/5byg+PJ0N4A
 I56GnK1/9JNxgZFWa8g==
X-Authority-Analysis: v=2.4 cv=Q5ziJY2a c=1 sm=1 tr=0 ts=6a6f3671 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=3ryqjR-gYcLxyyiNjjkA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608020108

On 02/08/2026 10:54, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Low] Incomplete naming refactoring: the parameter `input_type` in `check_block()` was missed during unification to `file_type`.

Ack

> - [Low] Semantic conflation: the commit overloads the name `file_type` to represent both the exact file extension and the normalized syntax family.

False positive, string is used as the file type


Best regards,
Krzysztof
