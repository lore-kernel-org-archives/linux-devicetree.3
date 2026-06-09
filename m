Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1332F2910
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 05:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780983440; cv=none; b=thivA5JZeeu0GROsGfJyKCzOZ72wtTl8OpvlEk9R/4Pl74FUI1F0nOZX66pPU7PeIXgN/xenYdW5D0M6M5vPmroAhqDdu4CrlIqkPLfKw0ygWk65KAtcYfuJjN5DN1rh59FV4K70o23SNF1TXm92HzVbmtxVoaIe3cgZ37OQj7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780983440; c=relaxed/simple;
	bh=uugD+ZTT3EoWEOXwbqISV+D0swD+cMJ1IGS+gn868C8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N+cn6kX0lL+bGL1uvVa4ck6wp3YCo/xRUnpYPiKCNBuUbT+GXBb5qDc44IJsfxkuxmttwxW0Y9W4J8PmRWhHYe4TUzifkkiY+JbeUcw3WfdobT32BoqnemL5evRzGPCDC4VDOfASaZ/OiYq2TFLpVJDH9iGTYKyOwxhpAQwkgac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bVeOx00s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M4F8AzK3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bVeOx00s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M4F8AzK3"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6593x6BV1065901
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 05:37:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PR2hiJkiUQvrfmG0FVY4y008fpQ+lbRvpnuUvQasTUk=; b=bVeOx00sUnruNkyL
	0n5nL7OW4FT6mS9hzPhdOu3hPkJwERH7eRth45itatpDzXferqMtBAUYXGki1MmR
	l0bJQFmXpP5n7AwoE8F93LhRCvLCdomCDNNeugyX6BP4LBeR4u7gpk5gXEAD5Uld
	HmhA5AzmK9YNaHURKyrwVqIYcfW9A4l9VEsZdCZ6O82pDuPZbfwKsBHdMW65VYP+
	Cd6mxvC/AOSjfjra/QYSbOXIkCsnZY5WT8sCOnH39s/HnMVh/4e/LCY4KQXx/TTM
	62DhaKAJmUHamNX6N7EIRsrxAM3NJiYn0KNgS9psvDjljJCtzNxtdI8lOOOQkVa7
	it4zzA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enw5m45tf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 05:37:18 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36b9d265308so3860130a91.2
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 22:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780983438; x=1781588238; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PR2hiJkiUQvrfmG0FVY4y008fpQ+lbRvpnuUvQasTUk=;
        b=M4F8AzK3eRmkTjN34hQXK9bqACNIalscJM3kjSbl/LcvvUGgNIJxXYdIjtgVqDrKRM
         t9AberkoqctwPxhUGoNq76auCvvx700gFKJTuUY3IekmqD2Dl4KjvLW63GbEAuFRJ+TO
         KKfkV23uRtjRplyfdOBYXuxhmqHWo6tmTCm6dCrPly5IHKhpENvslmDzESMDHvL+KxXY
         CcV137oG3ke+0oaA8+VN0kPkH4SPXP4ROjtZyTuyk8CAwKUWmsTM5Z/jQsciYnAf1su3
         ma6qZsKznspsGY2vdfeGA45wCrRsSou4/Pk1m6IslDBspaM57wOp+GPRy/scVgT7lS8y
         E5QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780983438; x=1781588238;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PR2hiJkiUQvrfmG0FVY4y008fpQ+lbRvpnuUvQasTUk=;
        b=p1uc1r5FRHgEzacc7agat/dEy7CYt/erMqMCyf7WKlP0sFV0s5vQj/yhCvCH2DqBSa
         sayjgnRaRfFSfAooNqp9QiBrCCl4AZwBM5Phd3LZ+u0kzS30GWRZC4eEy8eH/zi4BXqk
         AV9MfQ6BJYf4/smN+zC5sX7cbDBS5RcFaP+9E2R8G/Pq2Qzu1Jd6IPlkxu9IfXSq458M
         fhrDfq+X7iCknLUYnAEHZ39acyigF4a6FkM74qr9JiotzCCDVQTVv1JI7+061Ch+D7ju
         4wj5bzh0fcq3aC+YMMbEz61+1MDbXl63CvvRuAhv5GdF7bZMJwizsUkeJHtelEFadMvd
         8Pmw==
X-Forwarded-Encrypted: i=1; AFNElJ/lHsOyLBTTNWg2NA24Ja/NoyHwLPAj8GYrBl5X1WIsFcJeSxtQu2yypq40l2ggmX3FRaX8W8xUoXac@vger.kernel.org
X-Gm-Message-State: AOJu0YwrM5/JzCGgEX8fY3jshK6iMc6VaibtFjIP1dGrHOsdW/4EY3/b
	CPWwR3fO4ecqrFCU0QU76K7MqKXxTbTqe/kT57Ki2QOU+kzVzTaKe+5eNMR7xfgitrBZ3F7ZYVw
	cnfsisIqv24RjeyZOXqx5Tw6kO7sU22ZarTUH3J7boi4rsLKeHnrYupbLwHVP1u6E
X-Gm-Gg: Acq92OHSCIO0SxVoEkwPc7MTSWUwhSTMlF99lBoBpeXHsIrarRg7YUnXcFVuOXaLpKf
	WihPNNzdpPe7V730qeEDyK4x8m9F6p9PC6Iwxyh2kQtqtewhi/cGTgY9TXR0PGcF/DKfBy6Ilas
	d1xTh/l4H9qseMx5IF9N9dfKQQDM+/Uy3CzbGoTwVhwu2YKta8Q1VG/e8wTZl3fkB7P5kzOM2rZ
	2bKEHfheNl8qkkIjz3fsQH9gncAiA8QI3N986/DzkfKENvQ0hETmnggDNSzZX0SnUWD1RszWaf6
	7N2QNYaveN3rBmF5cRNvonsOvfBUEmL540J2+um497Ir9tqVy4I2TreglDvep5/iUOTFnh0/dM4
	RUmly59k62+G011T3PpG2h01UBG/MbvRC8jlRgLqNQNaRkA6CLK0FXa2GHSeBjGI=
X-Received: by 2002:a17:90b:5210:b0:36a:8240:2477 with SMTP id 98e67ed59e1d1-370f0967012mr19947161a91.19.1780983437847;
        Mon, 08 Jun 2026 22:37:17 -0700 (PDT)
X-Received: by 2002:a17:90b:5210:b0:36a:8240:2477 with SMTP id 98e67ed59e1d1-370f0967012mr19947132a91.19.1780983437420;
        Mon, 08 Jun 2026 22:37:17 -0700 (PDT)
Received: from [10.217.222.59] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6d109dcdsm20019455a91.9.2026.06.08.22.37.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 22:37:16 -0700 (PDT)
Message-ID: <26b56175-a83e-4c3e-a871-28fb3aab0725@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 11:07:09 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] dt-bindings: dma: qcom,bam-dma: Increase iommus
 maxItems to seven
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org
References: <20260521-shikra_crypto_changse-v1-0-0154cc9cc0de@oss.qualcomm.com>
 <20260521-shikra_crypto_changse-v1-4-0154cc9cc0de@oss.qualcomm.com>
 <20260530-spiffy-glittering-quail-dff199@quoll>
 <289a5bca-5491-4fc2-92d9-1102aa664021@oss.qualcomm.com>
 <844eccf8-4ad3-46a2-bc8a-67895d629c4f@kernel.org>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <844eccf8-4ad3-46a2-bc8a-67895d629c4f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA0OSBTYWx0ZWRfX1VdTuM1RqIEe
 kXxsU+5/CCkTmkIKDF4Hdx1UmCGwMhWdAB/srMxNUiS8DnRrrZC8EdzShBbQdeOV7D/vaImjRYQ
 13DhmUQvAavWS4SlYQGa4MuFZgi/GfQE+8tWjb928g2UH+IVb3grkzQmxgDGQl/zt4typeVsByK
 q1CGL7BbVJ4PucecZlFaAn7IIkFLHmD4x8wSF+oX/Ce8J2nXZKvaN+ZU47hOfWHfvpb2sNdF0Ls
 8qcxfGhtVWiXhT3Kf0hA+pNrDHF1CUPrNB2ChmnY7AbDtnDOg1Uo9Usm//Tk+Wh20jBC+HaigA/
 CHJiBVWtHYuMGcCrK7plduhIhCvfoDki2nZqYjl3blRZlzljMEiB1/j6yelkGd8eY7hAlPkL6el
 KiojpihOvjShcmlrTMm0zCta9mWlfKs0XkR8ahRkQ8ZFM5VMa3X8+atIWbl6eWvE3sEtK9ga19u
 lwja3eQUg7WoCL/9wfQ==
X-Proofpoint-ORIG-GUID: _CANQiIFZkfYNOzcTLxkIdKQSYanqZqx
X-Authority-Analysis: v=2.4 cv=UptT8ewB c=1 sm=1 tr=0 ts=6a27a68e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3IJvv1DdaQ7zVQMhPnMA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: _CANQiIFZkfYNOzcTLxkIdKQSYanqZqx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090049

On 09-06-2026 01:19, Krzysztof Kozlowski wrote:
> On 06/06/2026 22:59, Kuldeep Singh wrote:
>> On 30-05-2026 16:09, Krzysztof Kozlowski wrote:
>>> On Thu, May 21, 2026 at 06:47:11PM +0530, Kuldeep Singh wrote:
>>>> Shikra bam dma engine support 7 iommu entries and not 6.
>>>> Increase maxItems property for iommus to pass dtbs_check errors.
>>>
>>> What errors? There is no Shikra in upstream so how could we have errors?
>> dt-bindings updates are prerequisites for the DT changes of ice,rng, qce
>> and hence updated bindings in patch [1-4]/5.
>> Also, the commit message mention about shikra and DT change is also in
>> same series.
>>
>> I hope this clarifies.
> 
> 
> No, nothing is clarified. This commit msg is just misleading.
Yes, I'll update commit message better in next rev.

I specified error observed after introducing qcrypto DT(with 7 iommus)
for shikra here[1].
Sharing just error snippet:
dma-controller@1b04000 (qcom,bam-v1.7.4): iommus: [[31, 132, 17], [31,
134, 17], [31, 146, 0], [31, 148, 17], [31, 150, 17], [31, 152, 1], [31,
159, 0]] is too long
	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml

[1]
https://lore.kernel.org/lkml/11c2d639-d2b8-487f-b627-f507bab25d60@oss.qualcomm.com/

-- 
Regards
Kuldeep

