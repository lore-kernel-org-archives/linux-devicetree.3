Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F8938E8DC
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 06:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788329023; cv=none; b=r7WkSeAsMBUSMS+9ZGA9POu2Xm4Co5e/PKdocZTXWerNT6h/y3392Cz6UFxThLxwXkYrHYZyT1s9LbZrA7To5NyjPdDhK/MYdQVpdkFMbxJZpHzz7DjVbi8S43B4969B3hxbx66+BZDusWINic9fcNKApWHSdSkhHn962+ja/Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788329023; c=relaxed/simple;
	bh=o97CWqIQFcEcZdUT86XmhToxk7DsnJcoxqWppEhsMBw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ViqIbmZmI6P3XCfco8SufUyJOwvkwzQgLbwp9MmzH/yeaVnSkzowcPNnquJ87TgMmVdV6+Mu3e4tLT7hwsYFWxB/1DMSVJYHmj8x0QPWYMAjIuOokum8hoZWeitBqQe1ynKAbM6sGJFBbHd0L51PmP8RQQBzj+gOGkx0Zgnow4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P3j2xj3d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TplpEiN6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P3j2xj3d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TplpEiN6"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6825YQoS077490
	for <devicetree@vger.kernel.org>; Wed, 2 Sep 2026 06:03:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pT9aAO/eBtnNkWcr6KE1/DU0x/sG2h0E/ZtJ//Xo5T8=; b=P3j2xj3dhal1GG8O
	ZW2h+1eZz7dqwt5vecp/mzjDW/sZpL7VbAH1Ci4mrHqF0ovJWdL6ItQQaFXLyWkB
	ko+3KmQcBFcFMNBgaqVE317y3wwGNGsE+nJP1ZYrRJHqPRxMmn49psxdELdruhFg
	j+AZIhXpstsah2ib2RowJRzBjce3numTN7spiXdqmdrvNggSUXXKGsvIK6SyE3uT
	/mWs+JG2gRMOLUCJljt2+FL2Z0/kE2z0A4TQzfT7gSIlJ6aGSEorZhX8Xh/jzECY
	dbwdayQa5/iZk5hlX2n2iBiGXUW4FYIOsSHJS1yNqO2d53YHGrsRC/glPFSG4kwJ
	FrcAgg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge1wpaw2t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 06:03:36 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-398e1fafe17so1046242a91.0
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 23:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788329015; x=1788933815; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pT9aAO/eBtnNkWcr6KE1/DU0x/sG2h0E/ZtJ//Xo5T8=;
        b=TplpEiN6ijx/4BaNDVyQjANqVB6AaXlBDGIQY9hu3lW079TBeajb22ErvagvbHvKGA
         RTf9q+CXTEGYf2od/0/crlSuAvKMmIQG4j0tjdayr9/0uBFEOfQZFjdSY0Ftmm2inV8f
         SjZB24T/UKf0hxyKgwe9qpNjBUKhKLwKBUoVaw7surG98lNqrdGjn0NXlnY5wgGRwtBo
         RLckSD/fh8UzlRQ7SH+UtUkWNNYjz+9plj+ts9/Qj3uJN/Roqkh/8eUrU4J0tAlxPqRZ
         RcxWm5+BORT0Plm9cb85tFZSHlsJJuYTsyoj9nAbxBrPLRFS0SxuDNURAVs138/tGd8K
         lv9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788329015; x=1788933815;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pT9aAO/eBtnNkWcr6KE1/DU0x/sG2h0E/ZtJ//Xo5T8=;
        b=jRQWl6HjmsdBvve+/VLRgpH+Ss4bIuy7mPeZwsqfuHTdjbmzvgp490zO8smhVQIeok
         44widzGVvZcJb3v94lXu2yJFb7QV8iKrxnsT6xwmgGuIYN5hEop/kMgj5dftDPVf+aQ0
         1rUyYu2L4E69IjBD/dumRGfge55n7+bpIYE/i5ZiYP9mI1bqKmXGKTO/h29f5c+V6mxV
         ZRHs6zhLudKrGOB8AZm8oq6Y92JXO1+orrtcejC7SPZmOFABDx+hXoN7wrokug/jGAcS
         D+pfOBzmVdN738Oq7f+F+lwy2/hF+7oNAWW/4F0BJ/nuRY6eqoWUj7WRYblIk/izZ8MS
         UESw==
X-Forwarded-Encrypted: i=1; AKwUvBywQ4+r7wMfuRp8H0tqTOOVRQ94vv9GbJG6HdpnRfqyGAAj7SZKsHx5LLIw4H3yvE/zmCNKKc+VCFbr@vger.kernel.org
X-Gm-Message-State: AFuF++lCbSm6to13dJfgoGeWdZI7+6SGfh3UAMRCH+czMG5hfumeTeOa
	PR854/C7hhmiKZksyXFZ7EuZzuPcSQ33maN6XDKsLPP28gS/RcpikbzZzaqVWktq0BW4sdU+N2V
	tW47ZNwfAFv5cu2VTXCw8Fv6NniczBI2jDsNcoqkEyQqOeu+4KTbylWV46Rf7wRm3
X-Gm-Gg: AYBFou2EIuOVnYvu8Mxbm4/ICaldy3epBtdWhJmATP29nw/pCkWzPVEv6hA3kXKyUqD
	3MK0ZLMs+IwqfD4fGtpyiWcbqnubM3/tz5I3MHyiZgXp9SpFTOta5IfX14BfURs3UoOaTORolWF
	+Z4Lj50qZTUICxLk1VXkJ4L2geh4sdlONsFgvB69QvlrxjMgJVp7PsWJ+aputBBvH44sEgDe5f0
	AvJTQTauDpiC27t7fCCn/jrMtQsjgaXkwip5/B7e6HVNQZy3j4jIEiq3FE9HrwFlxCnVJtL+Y/g
	iksuLO89eJQVI9mx9vnWtXS00Sm6GDWgnNYylqhnmIAXaJd978FLclnlcrpBLo7XHUY0q8D7Ye0
	CzJIzBuIqVlQ0ddknk3Rz6IJ1XZFZ
X-Received: by 2002:a17:90b:4b89:b0:398:c3ca:1ebc with SMTP id 98e67ed59e1d1-39aee105a46mr3196162a91.18.1788329015550;
        Tue, 01 Sep 2026 23:03:35 -0700 (PDT)
X-Received: by 2002:a17:90b:4b89:b0:398:c3ca:1ebc with SMTP id 98e67ed59e1d1-39aee105a46mr3196102a91.18.1788329015086;
        Tue, 01 Sep 2026 23:03:35 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f077fad2dsm3447898eec.0.2026.09.01.23.03.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 23:03:34 -0700 (PDT)
Message-ID: <5dce0c9a-84b1-4041-b2d1-54cbb55c64ab@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 11:33:28 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: sound: qcom,q6apm-dai: add stage-2
 (SCM/VMID) access model
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260826-a2a-shikra-vmid-v5-v2-0-c3dc62354eee@oss.qualcomm.com>
 <20260826-a2a-shikra-vmid-v5-v2-1-c3dc62354eee@oss.qualcomm.com>
 <c7c29560-ff28-4321-989a-e081f2870555@sirena.org.uk>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <c7c29560-ff28-4321-989a-e081f2870555@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=F8JnsKhN c=1 sm=1 tr=0 ts=6a97bc38 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=LkqdXz0YFAjP81C9FE8A:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: QeVb-zZLSnoC9dto_DBZhb_B9xEM1hJ0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA1MSBTYWx0ZWRfX6sw7dLc2YXSf
 lwV9lin6E/uhXc0yzt7TYb5b6EcHn7ufIrU69DSnxh7FJUWQc7rFjUGUkS/85o1bXeSsaYkKEZ7
 EiE+4Erd71q4maHThc3rHvUX6GtTjqI=
X-Proofpoint-ORIG-GUID: QeVb-zZLSnoC9dto_DBZhb_B9xEM1hJ0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA1MSBTYWx0ZWRfX2AMIOVHxTo26
 3W1bJwAa44n0ZLRE/Y3nQwFYtmbE3v8ZEW0v2styXmKRvkhlWtmY5ZPQJR9bb5p3pIqrcTIW8fi
 WU0tzJlzYly6CLzho14VzCPHulCvB8roRoYZeCOFTWz3JcLjl4rhBCMH7qpnS2+5ZhaMz6+lQro
 C3BHKoB8PuMlWenkNAvbudg3gtAOdbx4IkZo4ujYWxRNLjffFL0WWCdo3WDQpUP6cBgTfizyNQq
 s6yLHWXbjqdCQyuu4W5Qrk9Diy8aXesdXi6npuIwduG4WFWavzRsxySiyS5p0bQtxol9RRKvycP
 nWpoC5Gxdg87ufVf4fDDmjVEbqZJAecapY8xLjjL4dKacp5+1d0cr6dP4BRyx1qw0mj4OPhSAfb
 2e49RHaFkT6J3AIkfS8TrqSaUjjwcaKy+gw0yZthMBgOm1wbvKLaWA/u935d7E2d3FX+nPfufq3
 llPGvS5+Aw1wYLn3Rrg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_06,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020051

ACK, will follow in V3

On 8/27/2026 4:14 AM, Mark Brown wrote:
> On Wed, Aug 26, 2026 at 12:10:12AM +0530, Ajay Kumar Nandam wrote:
>> The APM DAIs expose PCM buffers that the backing DSP must be able to
>> reach. On existing targets the DSP runs in a stage-1 context and the
>> buffers are described to the SMMU via the iommus property.
> 
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.

