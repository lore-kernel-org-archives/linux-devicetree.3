Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5EA549C4D5
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 15:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788364415; cv=none; b=VI/IYNhZ8jeBeYtoELgS+5YEHJYeEcDMRFdtY1fc00chxDJzUlBjP6zAGwQFh34GXwGQDp2yoqtpTD35qz51bimxRqX7BvbOBBD3ZdPkrPmw8AD/4Ngx/6yrfQeP/TSW6JuPu3Mqlp04x09UvI8ne8SqxPrBllxrKF/gtJixBXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788364415; c=relaxed/simple;
	bh=M2iZKvRdwplPax8rxY3WcgzBwFQS3AeOHQatw9y082w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iN3X5o7JX1i/mRrgyXJC38Hj6e/oyvB4ngHbKY5+V8c22VTw6kMYUIFbfSu4C8oE23SqNJtGuc9ycWAT37JTrPy0+56tP0QZdhMLQeWJQn5+3KTVt9zf8MtSHveyHdiolSJXdqTl/+KE8t8OdsGVaTjdlAfJZVsqonSmWkj9Faw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h26UC4Ql; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QMMhhSlq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h26UC4Ql";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QMMhhSlq"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682FZNOM2067375
	for <devicetree@vger.kernel.org>; Wed, 2 Sep 2026 15:53:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tqru4wuRchVv2A67ZQa73QrFKsMR92K1b4x4sPPUIyw=; b=h26UC4QlKNy6XYp+
	hGK1ImMOiRwBNkVdVfljNeVwgP544n5HEne9AOzvSrLKrCWH46B9prV+wWuasgmj
	TXdYXf0I+NXY3nWlGHdMEywfM4QdKszpwl0aCgCRBpZf2+nWj2Og/yewFjP0ub3H
	eheh5mFOlWdinmQh8JDHSZrXWu5nKgF83MiFoB6o9EslHXr++Blc24vULW1W0umY
	Lep++EKgH3zX7JWvvX69UOeF/wf1c4P4HTOOjmEjVKnRUHoZrDYz/FsF2wUYg8c1
	N5QaYz3azcanEAeQnI9fjWpeRqbBo/F/azNQz02d7h0GGIM284MxAuduBWbknjEo
	AeHoNA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gejv892j2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 15:53:32 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52b4e315000so3798751cf.1
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 08:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788364412; x=1788969212; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tqru4wuRchVv2A67ZQa73QrFKsMR92K1b4x4sPPUIyw=;
        b=QMMhhSlq8TclJO4hpEonzxBjM+qfHrdihG9cDzM0WeDqOFvsZC+0uOjU7i7VT8VPoT
         eGC+dW2CT37/KBAyrQGgsR6PhaipP0XWBeM6axYBRC402imbg7WG6SDeMUDYA9fADUEk
         yok4d0SX3zAI4Bfqqo97FJ89thAIeToH3yzZULweSa40OcLkA9cVhuSBdfcUL2HISXhN
         fdj0Lg0iWomcs5Vfag6EdfesPsclPoM3f4gYEgqujYP5/7ZYsN4sL8je3xJUELPGfYPF
         JoBU2KrThziLiq8fHMZFrH8tH57HBIhVeOXFD/h/G3r1uk49aYnSXLWFOJ8N1j1GyD2l
         CQ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788364412; x=1788969212;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tqru4wuRchVv2A67ZQa73QrFKsMR92K1b4x4sPPUIyw=;
        b=b/p8eQdUIMTyPprLKjSqvvrVjLBeEVH3wJrZQP08ZrPFAwoOPMu2Tm/RyOJfx9Cd9E
         sWHHd0n8mEppjFlDEmpIgTBkeqE46sXVldyFCiLkVUh/2TbpWRTvrhl0S1Mcak9EF30k
         d/jqnl7GsLMhmqEn2vYCGl3LYqr03hTg1QU7dZS77cWpxSHViAREA3eThXrhHMdICjEt
         lJmRaFS+4ICWLe96O78/iW1liTId8Z1BjlS8bSBmOFlDXpXjtQlQolr23wUbkO4QzygF
         pYX+Ce+kxFhE5xM/aWyYcPJ6qhdMXnGkbjxdlIa8tLDVNGgD2Ml6p/RRu6Xyhn95J7jy
         SRWQ==
X-Forwarded-Encrypted: i=1; AHgh+RryYmAbyt2URso18CXrgdiTE/BSQMRdnxXXYHwDdkjICGZ6/Sh0MFiFHmaIjsLt3av7pw+qyhJ9dsyC@vger.kernel.org
X-Gm-Message-State: AFuF++l0xfAz9YMpYeKb3gQigMihyjy0aGnfgZ7nHN96punYubIk4rYu
	0pDP8TlWvB3e0GLqRde/UoXWEMhWOCfeqICiQokDWW5qzjIZ09ptN31LMfwfmR4HQ1KXDd1+6Kk
	XhMoiimtf2bUhafkc05C2gsnx8BzyezliBXMP1vLZuF+GshqLYUrbYxrWuHKtPkM4
X-Gm-Gg: AR+sD12yGpe7a4cvej62YYJPsrp76KXRyM/xVljAd0r0JvCtYJa/XKOX5+mXiiKIxdT
	2ePRLQ3jxviIFEGEv+7bxN51R3vygT8htKL/R+F7OiWmyb82aDkJml9hqMois3j36rh3+6TzNRk
	Cg+raZgCChStTXr4V0S/WCJx+sVjal8mCgVJ/ZdrXMZcepcNvUZ3uLr3gG+9byCt0L95CE7Te+E
	/PGspab15MdQzCNFKwvz+ZlxKLiaqRA317CxueLsB0LJi9UVomhjElxQ4sR87zrIyV4sNtakibR
	1utehaS2Q5yo98scstjyf4jNfL9z+umFguenQkpt07Hu/HLvZ/HvC30C4TGQETpI+iOUCdOJGwM
	/K9iCxAijy/sqAmCxAQoRlw==
X-Received: by 2002:ac8:5d48:0:b0:52d:f626:a46c with SMTP id d75a77b69052e-53036d5a52dmr40146421cf.4.1788364410092;
        Wed, 02 Sep 2026 08:53:30 -0700 (PDT)
X-Received: by 2002:ac8:5d48:0:b0:52d:f626:a46c with SMTP id d75a77b69052e-53036d5a52dmr40144931cf.4.1788364408715;
        Wed, 02 Sep 2026 08:53:28 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f895d7esm1289004a12.1.2026.09.02.08.53.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 08:53:27 -0700 (PDT)
Message-ID: <3f26bf2d-19de-4cc3-8af2-c26601da2576@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 17:53:23 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/16] arm64: dts: qcom: x1-crd: Mark the EC reset gpio
 as reserved
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Val Packett
 <val@packett.cool>,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Dale Whinham <daleyo@gmail.com>,
        =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Konrad Dybcio <quic_kdybcio@quicinc.com>
References: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
 <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-1-f4ab7e4bb75d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-1-f4ab7e4bb75d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hmqoz2dSNINo1WLCkPjTzIjjw7ncpGB5
X-Authority-Analysis: v=2.4 cv=L+wtheT8 c=1 sm=1 tr=0 ts=6a98467c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=FU8zUc8beOFBw0TLZfAA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE0MCBTYWx0ZWRfXyfI4JMnJCTt7
 U8ksVdtSFw+iC06e/BnvJ5W1P6HhZlWXdRnMNBHjxcEyVldbX8f0NraNjlB2eyl42KVF9nLs35/
 EIOhwjLdsfcMO8EnbMrF6pOnYVXrtfsCQMlA7k7wi5+uG4WsWk9ksrKQzmKqWX8ymiAap42qsf8
 rIbGVUe38Yaf6U5eTT5VdFUU7HaGxi4MbTwUAML/oyNQiLdHMlGH9f2mrJhQYaHdzpwvAcDRv6w
 2zQ2nCOmIDTW4yzG3H8qGH4V6b6oeuZBGa09+v154rysRHXVqZX/KX+HKMYQHYUVAVpCj/YL8lU
 CC2sPmDedI3zaMljMT7uA2jodyqS8HMxOEB30MfV6AI/D2zjly/fRjq0RR+LvvHRWOJRB0Eh2SO
 koF1driJ8Oq2ReeClNKAITN13TE9Qyor9dWzp56EcQW9pRCmYyLyXF/GRNgxvpzAxwzes+L5RQh
 L8zOhgMc0XA5gj68iXQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE0MCBTYWx0ZWRfXzbe28WYWvVdC
 PlF7GQzudqN9yoOmTC78iEZX1z1kjMOzi2J5VOjY5sgAfI1bzYX0zEo683Qbd1EBh0rmzci2dPJ
 i+A2LM/S6/1ItOTIirOLWRY49nU7zOc=
X-Proofpoint-ORIG-GUID: hmqoz2dSNINo1WLCkPjTzIjjw7ncpGB5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0
 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020140

On 9/1/26 10:06 AM, Abel Vesa wrote:
> GPIO 65 from TLMM is used by the embedded controller as its reset line.
> 
> On some devices, toggling the embedded controller reset line makes the
> device not power up at all, unless the battery is unplugged.

Have you confirmed that behavior on the CRD?

Konrad
