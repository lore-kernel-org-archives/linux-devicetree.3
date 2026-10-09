Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98BB489FBA
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 10:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791541749; cv=none; b=Bhvd5aMTNWGl+NZ2W8R8rtkiOjuM0YLSV9VfKaKVpn27oIg1lOQ8diHrOdm3AxkIGa6vba2+kBZZvb0d2ZxalJbiaWFzrOdHaQ+NVh9PEhX0AxubrhkgK+YeFW1LTjix6dKqDttKYtSyvo9+lG+39pDEXELi2D7f+EzLIW/MG84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791541749; c=relaxed/simple;
	bh=vUPMn3bxeRFEJEdZP1B+BUuNV5tvMVQg8taiABn2YJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j9jNCITwlWLXg4JLaB848DyGma0c/+fV2AWfiGz3HgU0uVF7ycws0ZMVCpQeHteGEBFc//dBdkQGV4xhMqitNk/gNP6zILFiAEVzZzCeoHVPbkX1mwqgyVVKH7mNSJpKR1HUKPYdl7Hh05mci1TogQ1uLfGbtCcUOtlDH/mKs9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ekIO43Xu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bhGmAKAd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ekIO43Xu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bhGmAKAd"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KIZh404386
	for <devicetree@vger.kernel.org>; Fri, 9 Oct 2026 10:29:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HyC5W/PoIqu6z550EClqx3QgxQlgKjeDqKv8+Dt31DE=; b=ekIO43Xu9VoJb1q0
	nMjWZ7vnjEKk6cnOJ8GBh37vu/nVLK9/maUlsUXgPxzn4Oswkg9jqlcNiZ1pF2Qx
	fAo1MXm4NyMMNnTA+BBf62GZOQyykkn0ScspVTFckGMJmkpc9m9zDhFQ0Hj+JW2B
	utt21eeJ7aF3rq17tEUqcWDAmHaPYF5Ofl+aXa1vJ+9S47nVRHxZm8mxsGburaKz
	LLpAdCsYkGlVphpzoIqf94WQ9t18GzWqU0wrTR4XXgrDtMqOyrzfps0JPykBjtG9
	R9TwECnI7c4PsxSiKq/Guwa/6pz6fPyAMyHJnWyYP6GnBelddoccs1IHR4K/20rx
	lLnmrw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxk3515-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 10:29:04 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3515266f6eeso3884924eec.0
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 03:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791541744; x=1792146544; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HyC5W/PoIqu6z550EClqx3QgxQlgKjeDqKv8+Dt31DE=;
        b=bhGmAKAdahxwTGV1UOWhfHOg4UQlnp7xsxyg5TJ2vzEbS5e6mKdC9F5sb+H0fowdzo
         2NBsrDAx8yt/Dotb96a5blkNWUJR91xR0BMB4IdEAN3WJ+xDHpmq61ZTxpJBASxELNhx
         Ufoe/Fx/wNW2sGzuuBgsYtd1qvZqkfacMxZIGkj6Lvi8RVDyUSIDSnhdiFgy6bo0Qcdt
         LPnHnhedq6eiQqdUsq+9igHlut3WzTbfEuCjb4rWytpmf8nf2hzSV/vVmCEDk7XFEgZs
         Sb2oJuDPGZ6xHmAYaFEofOMCfASwb2I3cMKAvfzQc/QDxCgOxbKBqO8nDT6iQt42jYm1
         1MLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791541744; x=1792146544;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HyC5W/PoIqu6z550EClqx3QgxQlgKjeDqKv8+Dt31DE=;
        b=dCpoUpMFVt5ELw6TkpW8IsusiIoOaXJbigjEDAmOxGKKt0gS9yVszHyHkF0JrmIXFX
         Ip2r+rG3Lef9rvUatgep6M723ZzuOM/hvyJBvwnC+reS0DPaH720ShJs9CQYTd1gSsDb
         NhcRqbNaFgio/ZJZk3tJNUDe4qXea6RHjNbIEPfTR4lTLq5MtP7Xi+BCl0tc1cTGSbOH
         1WVAW+SR+h8ggn79QGQDivtnHFIvCRxqGkmKriHbIxa0tRJCFvK+s4hz1I9woIT+S761
         x21KTzswjKiXAt3xkE0hH288PAbFtjdPvYtAq4pluY2VMFNCExRn7Hjgs0eafBlaXj1h
         RdFg==
X-Forwarded-Encrypted: i=1; AKwUvBzVUiXBgmjcT2TL3432fguD9EnlmeU5QxFRu+D+kp0AiassUS81qYMXjRW29sO/65bA1UJu18ilawOu@vger.kernel.org
X-Gm-Message-State: AFuF++n7NZF5+BIBLoN1cUXF/Llds2ayp2girP+e4ZUjx8EUkBwj1JxJ
	9AohUxTDQ3lKG5c0TAmkEg2w8h5TSIaiXth8S0kOFfs5NzPLPcYEXQVOo0YuRak4fY9PXagI4e3
	XLHXMg/loMcpB9XDKDh+HomjjiaLjnP+BvCYzcjrRAkddKqKorTn4ARw1U/0qSbDu
X-Gm-Gg: AYBFou1shrHvuMvinYdQCUp7wVJdqg3BgXpg1xiBPp7rQwH6iyUfkP+tt1aYCr79jD4
	PYdQ3Kjrnr5K7ZPTHNpGVNhffHL/rQfX/lo0diqiEQAmOzdZFQEQ6ylHtcs+iKzc/EK7KsI6nC1
	9LJLjguZ7BjawC9I19Q+cgx8/cwONcJ8A92iO2lxG2dvRE8xF810Qi+CgnyTFN2rKBogIbvs73y
	wuJZ8mjUdjXJVsrqbSxt0gCvCgNy18xlgwpvdLGehaNbcm03eHQVhcjNqydlQ8QWHZJqOok93gG
	iI++VVB392b1lDSDFbZhvEIzzGb03/uyx++FXQ0+0L3btVhv+/aTxySVFQsOhmuVNBRWAaK8gyA
	O7Mnoxg6zAkxbMjzaJFCZ+/9jL7EchqOkhjAiBmuZ/g==
X-Received: by 2002:a05:7301:c015:b0:355:b9a5:c9c0 with SMTP id 5a478bee46e88-355b9a5ca6amr298345eec.1.1791541744083;
        Fri, 09 Oct 2026 03:29:04 -0700 (PDT)
X-Received: by 2002:a05:7301:c015:b0:355:b9a5:c9c0 with SMTP id 5a478bee46e88-355b9a5ca6amr298305eec.1.1791541743570;
        Fri, 09 Oct 2026 03:29:03 -0700 (PDT)
Received: from [10.217.216.105] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cacb61asm6406058eec.21.2026.10.09.03.28.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 03:29:02 -0700 (PDT)
Message-ID: <b46051e5-6ae5-4e3f-8cab-4f7199b9e880@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 15:58:54 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] scsi: ufs: qcom: dt-bindings: Document Glymur UFS
 controller
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        nitin.rawat@oss.qualcomm.com, sibi.sankar@oss.qualcomm.com,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        "Martin K. Petersen" <mkp@kernel.org>
References: <20261007-glymur_ufs_qcb_enablement-v3-0-84cf4f861415@oss.qualcomm.com>
 <20261007-glymur_ufs_qcb_enablement-v3-2-84cf4f861415@oss.qualcomm.com>
 <c2b6taguiyyeteizf5ohdsvmeyaybbs5pm5cuv5vqkklswmxv5@5ekurkmzdhjt>
Content-Language: en-US
From: Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>
In-Reply-To: <c2b6taguiyyeteizf5ohdsvmeyaybbs5pm5cuv5vqkklswmxv5@5ekurkmzdhjt>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fKesTpae c=1 sm=1 tr=0 ts=6ac8c1f0 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=_qIwb01vgd_s3mhA8LgA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: 0f0riYgqtihDvaKznjXEx9KSMl8CMJG5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA0MSBTYWx0ZWRfX1J6UiMemxKXL
 pjEy5aMBe5S4/rxjpRWI0NQdnUsQEg/1asNrcj9eb5uwAF4r5xy92TQID+sC8IUNloh2VBALRFB
 1zoMTzBt449GMWm+daYvvtKAf+YghY4=
X-Proofpoint-ORIG-GUID: 0f0riYgqtihDvaKznjXEx9KSMl8CMJG5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA0MSBTYWx0ZWRfXxWvYqMpTLCkJ
 Yr32PgWvGpGuWVlMElSPYdjqKiyljp8R8w1+1Ska8tQdfqet/sSORofAa5xZ5SJ4U/ZCRLFuP/b
 9pTvJG31PYrpFJ7w0cmrzrpHYTCavkO6k934MbBsEoqNXHd+dgXXAKSepT8h54jbjVsZRvi5EP7
 GddBaZwcOOz4ujpzv2DhJGXxFhmA6YdE+H+y7iWml44ZsHOHkjy0c3mDTtcTL0zNrydfLQW6v1t
 lXMPTOvImqs+Zrchp11WkSH0Jzq8syDExdXp713eZBpV8AEQi+C2KRXS+kL+Hux1xXoPzxkoD1M
 vEfB3/+FdRrYt4RIT9YvP1o/RX4wc7mkuZVWK7oe0C5ydgfBTswEc12jZ0wUUDOzNIPrS4oceth
 ue9gpnOAW4dANe716KJIhHoViPc/vQaMCbNJANB18XxBaxEYWx8YpqKQanZxSlUFafuw0QGse/4
 Li7XHhB2uJjx3PuenHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090041



On 10/7/2026 8:54 PM, Manivannan Sadhasivam wrote:
> On Wed, Oct 07, 2026 at 11:59:35AM +0530, Pradeep P V K wrote:
>> Document UFS Host Controller on Glymur SoC. Glymur UFSHC has a
>> multi-queue command (MCQ) register range in addition to the standard
>> one. So, both reg entries are required.
>>
>> Acked-by: Martin K. Petersen <mkp@kernel.org>
> 
> This was a mistake. You clubbed both UFS controller and PHY patches in a single
> series and the UFS maintainer ended up acking the patch assuming dependency
> instead of merging the patch.
> 
> Please send the PHY and controller patches separately.
> 
> - Mani
> 

Since all patches in the series have now received Reviewed-by and Acked-by tags and have dependencies on each other, 
splitting the series at this stage would require waiting for the bindings to be merged before the SoC and board DTSI
changes can be picked up. The series has been rebased on top of linux-next, so I do not expect any merge conflicts 
while picking up the patches. I will take care of splitting such dependent changes appropriately in future submissions.


