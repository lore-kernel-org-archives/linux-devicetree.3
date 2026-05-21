Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CCB376BD6
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 09:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779357565; cv=none; b=i7NMtgw2NKnWNTWRuO+ELMtIPnloCRul+HPH3lH9Y89CEmgWx2kmxX3kpUUOfcA52OLi26PS0zIi3k9qPGXLbXAb5KDXIFZF7jAZ7cpYWVqymv6t1pGZDZStMkBMJ9TflYe9O+pGle20BaDyjDZC+jl8Lk0t2GhyZ66p0d9RKB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779357565; c=relaxed/simple;
	bh=iwRni7YET8FxX6xbOUKaSqI6koM88c23NPlbPCikH+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gqcFBzX0ubT8KfUE6VXSiMmKhH95X/N7vhIvRrQUM+vUa0DfXPqRN05/ZbrrT6OHkR4fWK1xxRDDfx+xcrHJ04ZYPMnnHqo3/G4e0Q5NjrBM56cqVw2wnnUflCc/gPLC9k2mX/iupJ8GbYx/fUeW+KqIK9BXEdtizgu7OBFlpUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=emEDbAYO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WIvC9qpy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="emEDbAYO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WIvC9qpy"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L9ALff3555979
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 09:59:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t3Y0NaPUeaoe/HAAo+5U70JZi2ClUY2ik0lHlKWALqY=; b=emEDbAYOqzwONIXj
	2TKt4HVKkSyUIZXTclctH5JzJ8AYQAUSIvrC4d18XFwI4QjcPbrhRFGXaqGSslr5
	BsGTAE92gQZSyvfKBkiTLGAgYrVhaArrOCLC6qalWoiEVEVQzUB3cw4Z7X22IhMw
	byOGO5uEup8yfXMHwRgLmbcX9uU4cBn4m8QCywjih1q47e83vjsmdTeUL+TCdmDE
	+VPTDR2IIseqtuLoqnsgmExoHMhfVu4YoF6eqr3kOdfEZLuOfEwmmISr32STBCAp
	p0EITKmZJ9ZVdfzSI3ZLFWtdCLmCc077FlMSskJzpPGay3oQVcEwGyQ+pMfzca26
	yczpew==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9fb6kx4f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 09:59:23 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d8c183c2eso32180321cf.0
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 02:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779357563; x=1779962363; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t3Y0NaPUeaoe/HAAo+5U70JZi2ClUY2ik0lHlKWALqY=;
        b=WIvC9qpy0Ub4oqPUH6ciQh4XYVXGBEWCiqhoBwVUktzzgn37VGjTod+sHZylKh35DQ
         yHHlYe0Zag5MdZPJyih2uaIvcfB4OonUkGPTTFshdfuMueA/bpW8rul0KdQATzDWxIHL
         cHbKkxvt1+g5/iFHKoxTTpGbAUV1OzA+HOUzcfXg+bi7PeC/wqfiVT2kaTu0pJAiyg7o
         ZJljga/Ea3h11dlUJQ6RG4n57/0Xc8JUwm4wrUDPmMlW5mEi8wz4rm0rY8gtg1djkR4X
         I/4t+4/OWs52gXQV7B5Seq0Wn6+ftC4uCPEsPxpDk/V9AnU3YHYNGOJE3hoiWqJD1xMV
         B9Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779357563; x=1779962363;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t3Y0NaPUeaoe/HAAo+5U70JZi2ClUY2ik0lHlKWALqY=;
        b=R44+MIifH6+xl0ud3VtP28HMLtnAdCBCzXMdHD9oI/0ncC5MwGiWdoQMXsYhLOnZ41
         3En2qUMsZKFbv82J48OelXAWQLkuFB/I8YsiuXM+3HgQIODhAZHjJnhXOgPz/hPFXiBZ
         +5Vrhwp/vwhVDagzNA9OZ1/kGTnkXyjpFOqekuMV6dCbLJQcetrtM7bFzz4Vnmdo+AQe
         yAXH8JIGuSu6g+dL53zbBWmLnz4ReMx+TUe1WNFFfLZB4+4iWrGWuQg5GV87IwsNxOGm
         SLrwqAWtju+s6nZzDcRAjaiyT736DFar/cE31OuXUoi2KxVuUVgwYy6hczNdhIt+3OCR
         eJKQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ae9LBRCWalTOkQpN1c6VX4ooJSOdrKUjJLdB4qhKnHxi54mxvvFtYt9ke7i2pbF0lmUj5rVFbyDeI@vger.kernel.org
X-Gm-Message-State: AOJu0YzyQ2CBLTDFb3n46UFu1JIRlDjJGVFJL3E9YRGXHwOKH3fCONS6
	TVctX1HExyGmbmOapfjU4DGjTwVGr799zXrE3y/xOAcw8RU/0D8eO7mMr/GCSqVLZiCIbTipIbz
	uNLWZ89sTOwf63J4vg2QCHxo/H1wzl1TV8Zztr7tMgmwIWRigDIET/Vh/SVyNSRqT
X-Gm-Gg: Acq92OEebbAQZqKkR1T6O/Z08Oh4pocdQ6BYSou7mu/qxqyfYwIwtA2wO1Cnc95a7Oh
	G6q606fX64/viHY5NoRxlOuWBqrixCtfQ9I3YggQ2j5xZn3Y+IHsD+W67AT+0PHohSMWC6PhHGp
	AO7pCj1oin/70dJ/YE7M7dsTpuR1DxOo0kIlUq1E+ac491RkMnpSr0SKESyh06c73T6caFL/dAn
	BYubtDMLw5VzEz0bE9I5kcyeNYEo7Dc/7zObQR3k3Vdyxt9xOyznEbaU50+BcZSWGJZDASOxU7K
	6CfrqGGQe5iBVvcXVeukpXqOjukCVkzxHxBjDiC4lnneA35wkr7R1OKxSljtFgbb94TqqQ2QO4l
	PX8BIuYuCiujA4mwcgTIkiVfx+u43BtyelvE9Gp9nxPKcmdPv0yOXllwC540HzSQCy+Gg5JgFp6
	z2b+YruzTB/ehG+Q==
X-Received: by 2002:a05:622a:182a:b0:509:2a92:8088 with SMTP id d75a77b69052e-516c54c365amr18783731cf.1.1779357562896;
        Thu, 21 May 2026 02:59:22 -0700 (PDT)
X-Received: by 2002:a05:622a:182a:b0:509:2a92:8088 with SMTP id d75a77b69052e-516c54c365amr18783521cf.1.1779357562503;
        Thu, 21 May 2026 02:59:22 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdc8a410e13sm23892566b.41.2026.05.21.02.59.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 02:59:21 -0700 (PDT)
Message-ID: <e379dd87-7077-4bce-a060-8bf460b27832@oss.qualcomm.com>
Date: Thu, 21 May 2026 11:59:19 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] ARM: dts: qcom: sdx55: consolidate IPA properties
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Alex Elder <elder@riscstar.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260517-ipa-loader-v1-0-3c3764c1b4a3@oss.qualcomm.com>
 <20260517-ipa-loader-v1-7-3c3764c1b4a3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260517-ipa-loader-v1-7-3c3764c1b4a3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=do/rzVg4 c=1 sm=1 tr=0 ts=6a0ed77b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=2tTTa69PSMra328FOmkA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: SBI_mVlK34SqkT9UR3ZSPe1tu40RiqTq
X-Proofpoint-GUID: SBI_mVlK34SqkT9UR3ZSPe1tu40RiqTq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA5OCBTYWx0ZWRfX/bVb3YFt5/Te
 sujekIIp8NM5qzJj7utgAHErgoFmlS+tdJc/Bhg4C8kWmnTg6y+bsY01zooZRovRw6maTYl1wqB
 VUW7sn6fc/4J2o3tGnRY4z6BeXW+2WdwkOiN8vyuHn6KJsSsxqCZvD6quCiMTfxyeqZ8J08+QSt
 yOqvDhJnCnjFDYUF5WwQZTb3HLn++t+4tPkUrDL892c2fdSMQub8MBTX7wN/pA1n5Bvcc1Yp2/M
 akT7CWF1/IEgerGtYvH3JNYNx0PUMRiuuCxzWdFZ7T6gQXCxl9MiEFCPMmP0o4BI9+flDdxz5zI
 VlcrGTl3rdjRW57uqd99F44V12WebbRwqxi8LJsE5KbzZ7hWa2limT8tn6jYXKzaJFtvhOmj1my
 1AL28G0tH2TxU1Lt5cJtvsXQN8liGCFwwsr3CeTGP7yVRJCpKZbm7wK0UosE9ZqI4ktAcpOVZ5T
 bsivJc7CBJ9VLYFlbag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210098

On 5/17/26 4:56 PM, Dmitry Baryshkov wrote:
> Move generic IPA-related properties to the base DTSI file.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
