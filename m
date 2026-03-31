Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264543D6CAD
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 07:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774943534; cv=none; b=Gsqau9Z8ItkUm7TK9OxMqC57P2SX5uZI+akoNM3EIYCYsvWMk+LZxacS95C2XTL6UU8AMf2drtz/jtUC+Vttpy2kI9Pm4jbfp+Gjsli7i3AP9oH9dzG6vCg7GChzd5vIA7Bj2hzFzVF4sQMKgr0AIz30JU+uJKZzh1sZ9pyhztc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774943534; c=relaxed/simple;
	bh=wA78j3kMngBreWSYtMlUJcKXyLiIrYfMXx8sDqogr8A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kik6KskmWwVp9qSbQnOlFrOs5bheq8wP0sN3tZ416iTaoogq2LcPFlXEojY5+XIyvmkzHoSI6rUbcVooKKNO+fkc1oO4bIzhaKZYgaCVxpLD7Bap5lhHcz1R+j/F6LyEQLqNrYx/ioURwShAQdJVm03eqD8Iy5sDqRb0KAiFruE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mfVvHcPw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WfrUzR/6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mfVvHcPw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WfrUzR/6"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V2dVKO4013626
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 07:52:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rnMbIIIsYMeq5NgReEDiM34tKVkTHQ7N0Rwb8NCEU2c=; b=mfVvHcPwpzLKI8o9
	NmIVT/KgHr8c6WAxjcAcS+UsXT4TLRDhLH8LkZYaBzoR0pYXG/eheSb876ZwPfw8
	WzZt0d/4ov1kSOSET0IJ+UDnIjNdJLVYKBmCgC8pYmxjTkcNbJQ2lUjpmHraHe9f
	XJ79Q/j0SXrxPsWx3rJmd3kiuPKPTqUfPk6sSKJzX/QqlsHqg4J42eiU8U4/yDP6
	Eu6TZFKFQW/E9I+iN9LrMwDfjmVKfOKEcyOAEomeDiw0h3c1uZ0u+0UoLcupY5Hm
	dmUW9u44bZfmMlLUg66VErkJy82GT7XkBhQPBFIFLtGKn/fEe8oQAiR7+dX+9Fgz
	Nn6beg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7regv512-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 07:52:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cfd003bfe2so159261885a.0
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 00:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774943531; x=1775548331; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rnMbIIIsYMeq5NgReEDiM34tKVkTHQ7N0Rwb8NCEU2c=;
        b=WfrUzR/6HKlO/c7KR8h84LwklBWuCm+XN0T8AdGD5cG+XfJPu4nG/kZNmxyF4yvg3P
         WkPUAX2DkldOie3VP5jSOnLhS9e2oV8CXLfbMbPbccUdp6g6PJ2+zykRX9/yFfzg+1/r
         MR/l4C4JWWkpfufd2tZVzb+sQlz7nNvF6dJcD++FbeCiLCv/ZxNOZMLm18WpAJnSQSwd
         gda6gLh+KOS7P2RHOz+g1SNe7CUHmXJ8grxYh3rOD7K29N7GmMuTW7ItZkNrf474KIQw
         y+jsgnHRLBITPWAOwp9lAbLbT0X6ZIdKEnrEbQz6S323h4dPbaohe1QK7OD+ZUY4ZAdy
         ydHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774943531; x=1775548331;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rnMbIIIsYMeq5NgReEDiM34tKVkTHQ7N0Rwb8NCEU2c=;
        b=Ph+klnvivrdJPArcdSH+XcwgQ9MhDG3PM5VmV5BdzX6qoi5MifWvABL3c8e5QwxSyV
         n0tft5VtHKOUvuRCHSbX0GN+jja5jvp/etsunhcps9WOoNO3ODHy/sE5DMaUw7gkK5qC
         Zk9QlysUQBJBBS/3QgVwCy8nfZDvIG6eV9VRWYwKFmlSN+eoM4uKokU4lzg+pP6QMP/B
         8KhIUwH9/ASbW6axME+zBDOKHrGe5GKDajt4X8t/MlugkgQQk9jAZE+aHXAMl1I6+c6c
         HDpE/qxQoP8kKxVfvtmENyL0YWP4TddPtLVcTBOahrDj9PptGCcWLwinzQGVVIMdhc4r
         IFbg==
X-Forwarded-Encrypted: i=1; AJvYcCWWA/e1vNN4Yjk9+lWTiURDWFqludauvjY9hin3vhPtfkXLfllXlHUjhBFA87blXK2YKFRxeSzkTUEq@vger.kernel.org
X-Gm-Message-State: AOJu0YxuV+dgrBcU/PbQxkpw0E4uBd6qUJrhy9ZmTYMuzkKZJmWHzhot
	Up7AjgaTWUypmarxeZ6sxbaPZsncePs65Flg61p25FhsrwOklO9nwhps5aN1TtWrKknEGFkvx9E
	Hrzy2sC8offqF+dEDveAC5UPR7hibQrbHle+c4h88NH98xZ1lpCYEylVWQ2lm40Zu
X-Gm-Gg: ATEYQzwQtU/cybzwGzlOdkOAEzqqEZw+O08vE1Xc9zPLfvewaqIHodo9GBWLlsBbLWi
	QR2AJF7ElpIONduAEk3NwNTGu3aMFdLbU+q+ddGzo1yUbFghqZZ5dUoQ/j6ayFtVJ2R6nU/BQjh
	LF/WKePR3ejFZEI5vkUx3TtSCOzoj+2ZJ/ru2FrZpMuYhnZIdc9zkV32tcwxgruwbA+/hPvq1jb
	I0qNhSHCpVuvtpksHFducwtoHJEXE2pBIe8SyW7k01Wpjp9DgA8lT7UF5Gg0fDmc8khWsbaMHZl
	eBRBlKqEdPcgOoOqCq0Ekl1LqztHg3R6+CxGDrnPUN9M/dkuyafqw4pq4ywUulQSpvCzKXex7hP
	K6rzi6vBjKXDTgijbWvnvD1Q59nfLip2eioq79HKNGpWK4v9fT4LsKH//GQLSNCRAPGMCDKU0+w
	8E/D8=
X-Received: by 2002:a05:620a:2a04:b0:8cd:91f5:7a13 with SMTP id af79cd13be357-8d01c379c1dmr1563078185a.0.1774943531471;
        Tue, 31 Mar 2026 00:52:11 -0700 (PDT)
X-Received: by 2002:a05:620a:2a04:b0:8cd:91f5:7a13 with SMTP id af79cd13be357-8d01c379c1dmr1563075885a.0.1774943530931;
        Tue, 31 Mar 2026 00:52:10 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66b72a6ec5csm3226000a12.9.2026.03.31.00.52.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 00:52:09 -0700 (PDT)
Message-ID: <46ab9ef3-bb66-4506-99f7-caccbe99e7ad@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 09:52:07 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] interconnect: qcom: add Hawi interconnect provider
 driver
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
References: <20260330-icc-hawi-v1-0-4b54a9e7d38c@oss.qualcomm.com>
 <20260330-icc-hawi-v1-2-4b54a9e7d38c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260330-icc-hawi-v1-2-4b54a9e7d38c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G6wR0tk5 c=1 sm=1 tr=0 ts=69cb7d2c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=EHExEHXSfcFrU6sAQN8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA3NCBTYWx0ZWRfX4+iOeLpHgM5b
 DJX0oxQKwfy8S95vyFy5S0njTEQRdUIJAadyAlwVkq8+5Y/3/Hvb8bmoP98bpoM0zwS6hR7koHs
 b9y7lhO3by7bwqmn2ywfsP2wC1/a+r1yqotLCKB4BlSXv50/1hRNAzH9Fc3VaX+r91xAl/sUr9P
 qd1q6+9DlrXQ8qgl8q90kshGR1eu9I3mYZKNdOxDq4hHhPhtoLGNW9GfP0b56PpJab+ESB8GoLO
 7NeII6Ss2F+WQyiHkcsqxgPIQ+G9q/wqoy0356fV7kgPA+UEOUhAD0qW55+SXPPpS8Z8CEwLiFO
 cbycA2u1QoUypcFp59EA8QHGpqJ9TEbY/vJLxjZqJRrqmPlJvtjF9QtxncAkYSrpOLDb2mkGzHA
 nr95fXKhYoX2DDA7E9KcGtb/Pd4ti9Qo83HmnRVixW52u9mLrOb8D7So6ZuHJ5nGeQGnc+HPwp9
 SuFb6Uw3mW0a3gqXXdg==
X-Proofpoint-ORIG-GUID: _KMfsLsFahsXJ8kEAMMDCVTtCwdGLu3W
X-Proofpoint-GUID: _KMfsLsFahsXJ8kEAMMDCVTtCwdGLu3W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310074

On 3/31/26 2:40 AM, Vivek Aknurwar wrote:
> Add driver for the Qualcomm interconnect buses found in Hawi
> based platforms. The topology consists of several NoCs that are
> controlled by a remote processor that collects the aggregated
> bandwidth for each master-slave pairs.
> 
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
