Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793703012;
	b=xpsuBa/7QtdM/xUJj9Of5sCZpd2AASvcNcicQX48bXYX53CvoT6p6SPSz8VCh7qqBxMh
	 BR+P31Lz1m9DU2Y1sM498I9YPmuntbNUYrSAsP/aOk588eObUgGoSgAKrnvY+DibJUrFN
	 KNZVcVsWPdPvs9x4GUYIc7AJR6IqFhCoqEXprGvs7JN0jz5swBjcFVf1kSKiBATvKWdn9
	 peh2/3IH5ytZDWAInhaHG3qyRQVrwiFDVE1iyl8xk3Mk9lPDW048FZ5WxRzYb/zf1xp9B
	 QJCt+JLn4+fSJSM/oDPrrX2BcLRpcNXB4LXTPcBzx7aalQE0N4eDZSMB9OGsBN3bVyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793703012;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0BtTPxJY+SQ3iqv7Fvtvh2D/RiM3yHOC2GPAR8vYW/U=;
	b=humkrGS2MS0kKO+FEzkl2Mzz9QalX+mr36GQZMJBkpJ8G7bYjHmlNm6NzKff34yubz1R
	 /VDlvL6bW5jsooGXiEFXdIlr556VQu0rzpDtA1y6QvLz9Ei4Tp8JIcvmNbvhRclBiDcvH
	 9I1vy4vsmNcpgIufQ9Nk69GTKNv2IZd7FdI7V5bT6BwFmrvjMlMWa86SGhuxn1bW4msO/
	 /O6kh9OrDjEhxwEmWn5jkd80dM3EW3tlKBzSzPGRripWBSeouNxGj30V42ElIU6slwJfE
	 JiqLXr4vXpmxfRzD7TLSuymiNSnOC9IfwFFkJrhdefXe7sJsQGjU+7vq69KmTPNiJog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PZJCCqn9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GvOsRQ4S;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B641D606C5C9
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 10:50:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B641D606C5C9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PZJCCqn9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GvOsRQ4S
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AAVdT2201894
	for <devicetree@vger.kernel.org>; Tue, 3 Nov 2026 10:50:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0BtTPxJY+SQ3iqv7Fvtvh2D/RiM3yHOC2GPAR8vYW/U=; b=PZJCCqn9PIF93YCj
	bsDrUAcIaAMX7chydQEVwshzZTWAPmRhpL6I0m+iFALgsc+HqipijCebGazIwC+r
	n4xhg9IjMjcIJEfpfgQvhodT8LXaqHWlbfVxCKClHAG1lEyZbxqIDRj2hQkV7LGs
	QYPSBCpYxQbzo1NT8B8jD5AEOSMNmOhxmNJOQuy5MLF8+tTtOdcbGUCzQgwrtjDQ
	BQIVZ2jwChsjP8sz7INu+HoL3lvMSceVfrKzL6ZQvpHtVcxdTHzcYD5vt8R3Ntze
	FpzoNRiWGrT9fOGt9ZG/H+jkrCj3aVhYf1stXrYIcXY5gpGZNVv83+QThrDHzWqC
	xTd1fQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07r3bp2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 10:50:10 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ae6fda7a00so3649800a91.2
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 02:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793703009; x=1794307809; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0BtTPxJY+SQ3iqv7Fvtvh2D/RiM3yHOC2GPAR8vYW/U=;
        b=GvOsRQ4SwQWHYufEJE3qpVngPXS9rnvKDsWp0i6OJfJGo7bJGxspVKuX3QblpJJaVG
         33fqCWgTsdp8g7YPK+A+F6EmK/kIQs7p4RsKzz2Fo/e8YX5orQ6lLdnpyfWd5sp5w9ut
         0l/65/0hP0WITFhEz0Nw9TlguNLkI3w37D0XLr0CaAnVx0sDvpdzvASXIeHHJFwdQhf+
         5YOktwj8gZ/xNiq4Si/D1EV5x04S2yuRSytk+XQg+UFwS6SXeapxuOjf/FUoxCxVcXeS
         NqDcwP7z1AFGX3fb8R+dUsmZ3mR00eZ+tDxnG9c7R35DY3qfo05C1RUkvgg/3mXnYgEl
         q4Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793703009; x=1794307809;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0BtTPxJY+SQ3iqv7Fvtvh2D/RiM3yHOC2GPAR8vYW/U=;
        b=Wragbs7FM0uOBub2/v+M8c8X0esNErQU3drGBkASBGJudvHn0gbOzvAmwrTjGyuOKa
         uJjlW71eTp3uM2VOph6QUWj1nsQnXzdaeJCv2mbrjFHlDLCOBvBiaqZzG2TWhHif8xrh
         5xgX74eSoVpluFmv+HzbF3jlpYTv2omo6112aNcKV5OllTUHhlZUsJPQZeIOLjZDAxk/
         sjVUzi1qwjCq6HjM/+5jFEbvFiDiPngnmFZ1y87nqRS5mqlbtWd3WAY/IJ7xESu24ZeK
         wKh9Um7Z0k4TjWaUsMtQ4GkuYVkCnNcCB/fcsv8jnLkDxPWbyWv3tKW5L2hEgpbaHwnL
         JItg==
X-Forwarded-Encrypted: i=1; AKwUvBzc7y0uW7zG7nDoiVYVV8umYriU0qaSUDo3fGAzDuV6OALDbO9DE42nUG9IobPvoYyKS13cfJJLeeff@vger.kernel.org
X-Gm-Message-State: APuU4Z8Fl46NcqQnR3+wXskl+C+lqAwlpyLEMKHn/61pfCTpDuuiEedY
	agJ/OUfTH51DMzjkKGD8yMcyblRN7EwskukJk2Wi3zs2nePh5B7QePaJDjiJw3wn3/6FuILMSVO
	973lTqMMdixm3tpUFuVKaZF9MSA0MECBHXUSKHjwt6hY05ggiGi0rDNAWGnwwH18I
X-Gm-Gg: AYBFou1qyTezc+1SdJLXx6cb3R/U8NmASUunCp9wla1QExQR/wednzdSiJ/EyVd/ws9
	SrC9shuVwbmzhPtC5tl5n9X+Q9rDpmsKq218JA35TN1oU6U1DaLHoQjag5RGTug4Ic4PKedDYbr
	ukQ8TR8zt9r5kMm6oPP1E+3+00h8B+K3M5hOm/Nn/Sr5K6YYnwDWzFOZ0PY6oa8WM/Pt4TUwK6F
	uU4QhlOR2TBu5Zf5Ih1nhcKZOTqxElC0yx18o0QFFQ+oEHe9XSltZGoHVX6qm0hb1V+uFfAIj5z
	f+rnf0ryJQ/3zRqTxHAm28PwKiAIfD57GXnjac/1YRvXRs+CjYMUdxkkbYvyeuxP7eAx3ialLSi
	kXdj/jn3zZXVKmatUecPEYh1n/qKU2j7zTR6KTLEn70ZWfhHg9HY4rAk2BcIj8EPKHOFL4gJPTu
	NHbe3jfToTJTm05RHV/xyg22/ASOWoTU2Ux+aiMAGnwA==
X-Received: by 2002:a17:90b:51cf:b0:3ad:818f:3da2 with SMTP id 98e67ed59e1d1-3ae8982cc41mr8675053a91.63.1793703009479;
        Tue, 03 Nov 2026 02:50:09 -0800 (PST)
X-Received: by 2002:a17:90b:51cf:b0:3ad:818f:3da2 with SMTP id 98e67ed59e1d1-3ae8982cc41mr8675040a91.63.1793703009003;
        Tue, 03 Nov 2026 02:50:09 -0800 (PST)
Received: from [10.133.33.42] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c583d0asm3915104a91.3.2026.11.03.02.50.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 02:50:08 -0800 (PST)
Message-ID: <d4750da2-0e89-456e-8d36-a34c3420b285@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 18:50:02 +0800
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] phy: qcom: qmp-pcie: Add qref and refgen regulator
 vote for QCS8300 and SA8775p PHY
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        peter.chen@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260916102023.2054761-1-ziyue.zhang@oss.qualcomm.com>
 <20260916102023.2054761-3-ziyue.zhang@oss.qualcomm.com>
 <ded7f87c-74d5-423f-acd9-efa83a472c2b@oss.qualcomm.com>
Content-Language: en-US
From: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
In-Reply-To: <ded7f87c-74d5-423f-acd9-efa83a472c2b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: A-aRFcfTtPQMr5hphkNAzDarPyqvypmY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0MyBTYWx0ZWRfXwx1BMECjC6Yn
 MJbr5EPdNPtlEJXidTMoH/FcmxQqLAV+7dKDWu3hkgoqL2f8a77blqAc/CJZjgrPaiOLCAIy/eQ
 HdRyEKXWJZF15LS6DXCeDtGMqrC2+F6kAgFM1PSthx98zMB+Tf8iLEo08X7p/29Eo+QdyJq13Gw
 vHiB97+E3xDnno23mfAvHBA2N/zobWhq8IxMimqLlWSu0fQl33FHR0ZhuGH+Sjm+NiDiJmAfYus
 OAhGOVLjCQ//Xdb4Lz2IvmAjr/o4Lzf0A9r1qVNENI99m+dJ2I+vBfiRwtB5/LZjMRQoCyJ4X4X
 5NRGqSOEVX9UgtFxW2BIQgUgcvM98un4yxNJ6GyQXToA8/nhvA9YIc0FyQvO8KnnPJqsT9AuuZC
 B9hPi9DuJRck93KuoZ6NVUiQDpkx17HAQlJdtGUOpb7OneILXYsetIaO7h+7ndmCuEJlIa0KcLM
 U8M85KChf+BP5On7iUg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0MyBTYWx0ZWRfX7DnVPnteo+ku
 VF0y2muxPfPyXpBR5njRFiBfSMURq8W/QrcREBvYS0Go7O1nfr/H674sgGdh4hI8YgpU32nEVVp
 6Ajx2nnYTXgfWOFlVZrhcE+0zgGreew=
X-Proofpoint-GUID: A-aRFcfTtPQMr5hphkNAzDarPyqvypmY
X-Authority-Analysis: v=2.4 cv=NZlzRGD4 c=1 sm=1 tr=0 ts=6ae9bc62 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=3v8O9tVSiMwV8kAMF3cA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030043


On 10/28/2026 10:37 PM, Konrad Dybcio wrote:
> On 9/16/26 12:20 PM, Ziyue Zhang wrote:
>> Add a new sa8775p_qmp_phy_vreg_l that includes vdda-phy, vdda-pll,
>> vdda-qref, vdda-refgen and refgen supplies, and use it for QCS8300
>> and SA8775p PCIe PHY configurations. This avoids modifying
>> sm8550_qmp_phy_vreg_l and breaking SM8550 and SM8650.
>>
>> These supplies were missing from the original driver, which was found
>> to be the root cause of occasional system crashes observed on QCS8300
>> and SA8775p platforms. Without voting for these supplies, the PCIe PHY
>> lacks stable reference clock and voltage, so the PHY never becomes
>> ready and initialization times out:
>>
>>    [    7.303119] qcom-qmp-pcie-phy 1c04000.phy: phy initialization timed-out
>>    [    7.309948] phy phy-1c04000.phy.0: phy poweron failed --> -110
>>
>> Note that due to a hardware issue, QREF actually depends on refgen3
>> rather than refgen2 as documented; refgen3 is therefore voted manually
>> via the refgen supply as a workaround.
>>
>> Fixes: a05b6d5135ec ("phy: qcom-qmp-pcie: add support for sa8775p")
>> Fixes: ebf198f17b5a ("phy: qcom-qmp-pcie: add dual lane PHY support for QCS8300")
>> Signed-off-by: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 16 ++++++++++------
>>   1 file changed, 10 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
>> index da83358c97ea..ab81c6e584a8 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
>> @@ -4094,6 +4094,10 @@ static const char * const sm8550_qmp_phy_vreg_l[] = {
>>   	"vdda-phy", "vdda-pll", "vdda-qref",
>>   };
>>   
>> +static const char * const sa8775p_qmp_phy_vreg_l[] = {
>> +	"vdda-phy", "vdda-pll", "vdda-qref", "vdda-refgen", "refgen",
>> +};
> I think we could grab them unconditionally, as QREF/REFGEN appears
> on most/all SoCs (perhaps with regulator_optional_get so that we
> defer the correctness of this to dt-bindings for any specific
> platform)
>
> Konrad
Hi Konrad

I think that on future platforms, qref will be voted by the tcsr
driver or another driver, depending on where those registers are
located. The PHY driver will only need to vote for refgen1p2 and refgen0p9.

If future platforms need to vote for vdda-qref, vdda-refgen, and refgen,
they can simply reuse this vreg_list.
BR
Ziyue
