Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1CD31197C
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 12:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781006943; cv=none; b=L/w2WQfvkS0rq+mHPj5PymsvXxF5Xqk2qTnVYJuPUS/QQdOENOxWf9yd9jZ9GO1vKbHBvW/cWGiSKxSXsnMC2OFNXIEMsqfjytZT/FFKfHIrrbuxwXz22opI5HbFgSNNEJXO6Rb/opzmBcf3g999dEAlZ/bOZeSYn25TtZ4vnzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781006943; c=relaxed/simple;
	bh=1XiWFLWsxujiQANn+NvM3ghNX3eNtkTv+Cq/YH89VV4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ctNK+S4GtNcRDj63nmzN5pm4yg5FqwWH/neOvebUUadXaGjgbZW15LuIlo8UQYwaPV25pKGVeNO+rS353u12OeD9DOsHNg6xHiQLvO5gZQcsO5wRhnzN74VhCb40SbVcrqdnpGniVeepwxM20rWljdmmVMOYwjuCSWCrHbtBiw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vehoqstn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G3hoT5rr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vehoqstn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G3hoT5rr"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659BnHaL2454547
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 12:09:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dYYsHxVGk7Sj544332KQB8eb4Ow5NsC++ELEMmHpcPs=; b=VehoqstnJpt0qrV4
	8+bnw9wPALFYNur5hUGGFcu6Wtl8T1TkhSAXPivti7QD34bCHGvIPw+ocERkFD8K
	u/QQvImFA2xWxsd8v1e34L/fnpVGd5bwfiZ4ErZ4bBoXP8P3nCLNWQCbP4MeAH4n
	pEMSDeTM0zCi/IFgxCB2MVNtib7wLVKwt2kWMXJO6eupcJ3qtaFngGec09FUZC4n
	buR89V2t1zi4e5Awj+GWiRbXvKxl3+hvUmy7sedrkEveSfRprMaiwNk4fhmmeUXr
	53AMvzBUU3QX9x/752j8v6e9m5fcChrX0zmE7C6E6Xv9YMInxW6aPGUtFF/iAimO
	tBURmw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epee4h4k1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 12:09:01 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-964172af027so5267116241.3
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 05:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781006941; x=1781611741; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dYYsHxVGk7Sj544332KQB8eb4Ow5NsC++ELEMmHpcPs=;
        b=G3hoT5rr5sP97l1ZJgxqjPSPx5pd6JHJrAIKx4MKVO/36pXYmjMVNd4hhxDBmALkX3
         mN6wcTbjTOWaz2xMY3amxlJafYDf+1lt5yzY+63eC2NBBrkF7O7XRhBeq9UqOvN0w7zO
         p0EEPQH5NlsKau4iscpnJzSdGjjY3FFHds+4k+FT0rbs8MP0AGpgtJDERzgDR9C26hGk
         U82xwbLjDW85VqZrExdkovH1hu6rAW0Yo/22AN4FdXoPK9uXW3Y/evmb/+Fpxz97IVnx
         O5C3cujHDptul8H1+zbH2ohXF+znRz1z2BdTaysLSfBtvv3HDXy1BZ7Mlbv4Mc5QLF1o
         mSTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781006941; x=1781611741;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dYYsHxVGk7Sj544332KQB8eb4Ow5NsC++ELEMmHpcPs=;
        b=RCekyoQCypVj7JX8SOhFQoH9WaRbj0QyA66xuiD6n2Dm0DJNGqSgkLcz+iMlmbgxR0
         UgxqHap6zB38nSFkzDbVfoAV23Ey7YiTIno2IKfAunegbo5VM2WVm9nQVyS6LMLy2Ali
         5HSjPMxMJaXrThSRWRfvDW+bVacn5j22ngfqxsUfxESfTAAcoFQSs72kGLiQ+EOQz+3C
         s8Svz+gwP0hnRHKXJdfJvn7nJly927Uxj6KmYOlmqt8n8A9eoG0BTxFL9AgNEcEZSKjD
         L2Cp0ry1nF4ndxfez+7xztDr6Cfow1uiVPX2DeJhY6EGOkGLBGEFJej4dBANGfq9L2Wc
         yZvw==
X-Forwarded-Encrypted: i=1; AFNElJ+9CHQ5LhUpT6FLBgQBXYuOa3GfeXCs0dC1tkU418Iml6QMPwEOpM3XgfVjD7kI0EZudwHpxGuX9bS7@vger.kernel.org
X-Gm-Message-State: AOJu0YzWomOK54ZUxc7ATiYgeuVS5OXmhDBXCCY46WFV/HEJ6r3onFS4
	dqAmaoC0j6SeLkH8iwXxa4mqeGonQdNOYN+NmbK6KBqigjQixft1tVInyyRO0n/T5H0rBPC8Xj0
	NTNnkMDOkoD2q7aRfsGd3xC4mNDGRM+mBKXL6Oja6wwobo4r7mNfuxcd3O5IEhVZO
X-Gm-Gg: Acq92OGoB130/zSE5VLqyLS99n+fCWGExWS+m+BnS+Z2e2QLXGM29ohvpasFcITXNKa
	xtJrYNdx1wvgX4OmeNBdntUwakJel7F6MC8L2lmsHYmkkTDZi2i8Xp5337FW7HcvcGBnmEqRzxs
	aozGItphFjRFTSpCKQuKPkumaG25PQpcpA7eHlsbTUh9aipFkt/eGJfKbT6++pIBP2+RlSrk2wY
	YZE3kng4g4yfz2dYD+uzx9WDQ5kjV4UEVCWijZxoCEnSdO2PCgLTEwISp2FhUVdE4URw33uvRVU
	9OL+JfjThnZ+1kjkq2691AacuFTkgoye+KDC68omQbudzmF9uKs0jqIS183/80UrX5A/hmRmBHd
	qajgF12JyQ1ykB1ym6w6AQTDGXbS5gmNfTUE+YASbpyBSzVJFyJxA3tabl5A6KgjFAsG5VCN4JJ
	lEC24lHjb/kZxgWX6y404=
X-Received: by 2002:a05:6102:41ab:b0:631:4e25:5e40 with SMTP id ada2fe7eead31-6fefc8b764amr10390566137.25.1781006940562;
        Tue, 09 Jun 2026 05:09:00 -0700 (PDT)
X-Received: by 2002:a05:6102:41ab:b0:631:4e25:5e40 with SMTP id ada2fe7eead31-6fefc8b764amr10390530137.25.1781006940179;
        Tue, 09 Jun 2026 05:09:00 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:78ff:9b6f:a837:626f? ([2a05:6e02:1041:c10:78ff:9b6f:a837:626f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dc412sm64030956f8f.4.2026.06.09.05.08.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 05:08:58 -0700 (PDT)
Message-ID: <33fe758a-a733-4f27-8824-3dff398e1cd3@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 14:08:57 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] soc: qcom: Add support for QMI TMD cooling devices
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Casey Connolly <casey.connolly@linaro.org>
References: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
 <20260609-qmi-tmd-v3-2-291a2ff4c634@oss.qualcomm.com>
 <pyt62qpa75nzdatp5xl7vcqrdzmrzsf5ethw6wq62bzg6b7qtv@ts2v53im4bos>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <pyt62qpa75nzdatp5xl7vcqrdzmrzsf5ethw6wq62bzg6b7qtv@ts2v53im4bos>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PIs/P/qC c=1 sm=1 tr=0 ts=6a28025d cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=JfLJAETMnmGwVqR1u6MA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 0ROGy85BxNdZ1jzjmYIEUoqGyHO3loUX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDExNSBTYWx0ZWRfX1vevaqDw8sVw
 8uErAOlGki7rMdkdiQdV4tqDgz6m+3kDdSJ5piIyQJZvoEvd8fuI5OgfL+Ha4WUbz/zJvBXp/x4
 J7Ob9egkmFL5HB008U2YmJMrZpL2CzFDlC8G+lNilQtTxh4yD8GTcAgV7H09QIrfb9m/tn5btee
 Vfuh8R4lVQYRY7x2yCc4OHDAtR59P4zhQ8moOFzq5PSkMeGWhWF58oaYDFrBhoMdwqYKx08BlIR
 4dTrTWouniba4JI3/NQbTpDGL08C0vq5tKnBS718Gpwi/bhfR/dbmTVFDV2wozshYzDqsEfQ3Sr
 H5pDicX3iDocQxWEFp4xb2bh9X9e3Zeae8mV3Lu+KXGocRcJYlAKpFJ+VtBnSFPUpZt6gC/RgtZ
 b0jZ2LBGYEeh7hHcK5bxx2M/njC8HbNrQeYERDE4/8qcZy/YW3jNZQ8fnrPoG/WDUcqbq0zBF0Z
 PPAGL/URKn7W8A/RmkA==
X-Proofpoint-ORIG-GUID: 0ROGy85BxNdZ1jzjmYIEUoqGyHO3loUX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090115

On 6/9/26 13:30, Dmitry Baryshkov wrote:
> On Tue, Jun 09, 2026 at 03:52:57PM +0530, Gaurav Kohli wrote:
>> From: Casey Connolly <casey.connolly@linaro.org>
>>
>> Add a Qualcomm QMI Thermal Mitigation Device (TMD) to support thermal
>> cooling devices backed by remote subsystems.
>>
>> On several Qualcomm platforms, remote processors (for example modem and
>> CDSP) expose thermal mitigation controls through the TMD QMI service.
>> Client drivers need a way to discover that service, map DT thermal
>> mitigation endpoints to cooling devices, and forward cooling state
>> updates to the remote subsystem.
>>
>> Co-developed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> 
> Wrong SoB chain.

I think Gaurav wanted to reflect the changes did a back and forth 
between us, so I ended up in the delivery path somehow. I guess adding 
Co-developped-by should fix the SoB but won't reflect Gaurav and Casey 
did actually most of the work. So I'm fine if we remove my SoB to fix 
the chain
