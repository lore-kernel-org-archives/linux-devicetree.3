Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AA33B995D
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 08:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081877; cv=none; b=Q/hGw1uOHqUD9HuqzMMyqmtGtN3oEbsaYlsU40CL3vtQbr42hE+6wS/ln0H7H65RlgC3lj4LDfQZkpmSir2Q39UbXYQnbHDfuT0NhnKbtk1v+9dfbXCaEGVLDntHMy8i17z+265BaKfdyYVbqLmSaJlTPinIIorpR/Amt2a+lIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081877; c=relaxed/simple;
	bh=QAyghAcVt5eMp9xbZvGFYS2BVeiVvAYw2ldCx0CAKus=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nxTu4Ku3FSIiUhipM1Rwo5Ibfui4ox5nDWbdZ7d/kLUkNy3HE2nntHD4QrxwYc4ihhK2nBfGRGRpPd8Y0Xl6aSK9onLTxf0F569+g0+SfF+QqMfi4m6rZ/u7YkGOaPYCkqOgY15ziCJLs+EZOg+H31D/qkwBUBcUMxx95OGJUwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XOIUZIYj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RXl/SsXv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XOIUZIYj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RXl/SsXv"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7iJN2988897
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 08:57:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wRCC2WnM2rmyRkqpJMx+C/5ibx09IpAJLZaFTYDrsgA=; b=XOIUZIYj33mFM/Eg
	EnGv7UJ6xm2qGYmtyELPxQ1gay9QLzQGOLbpoTpSfuc87zWaFvjYJsNRGn0ECt+O
	lAo3cdcj+Kx4JfydlKeU66bIzybg+I8iRXzFbImtoi1ByPnrA9xjAviOTb3PqhlL
	k2K35k6P6Nhc9Zt2M3KzsTkOQlCjenBb+TjnGMISxll3zObZicWBZzHuT48bTeDu
	ds9rywceUuwpQ7KGEcBqhcyid7LHGFpFj/C6K6ylUh1HLYSNMhmJGwcI/pYN1sSm
	CVgvW72BkVKFGVsGutkQnOIZAwd1SR+aiyckbjBfxRG+7Os3TaSHq5ymGH6j9l/P
	k06S5g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq2seghd9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 08:57:55 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51759082206so19318451cf.3
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 01:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781081874; x=1781686674; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wRCC2WnM2rmyRkqpJMx+C/5ibx09IpAJLZaFTYDrsgA=;
        b=RXl/SsXvv4Ldz8s1OHpvIKtqKmv5qxcZJvP3nPH4nZr+cOiQGRcZngKveHfDbvP+4Y
         4lAXqE9BtiDccjtNpzc4Sa4Zw0XzTgRXvUbypqY+9dC9No69q+8I8CG4w2+ZjE+DIJnL
         bpm9yFlgWm2OnV00SQmQ7dDpeThWULRcefhlM/ATzJSy3z70wwPNDqaxry92Yh4QN+ib
         44fp7kS8t456xfcc7MkLbBpSfuP47Ay5U13ndHptjC7tlYApNjLx8trX8+jofxmAloxt
         QA0kOVBadx5js53kjF0J78FVkR5Qk5Fb28j8zMQi1Phv18YrEnRqKx3uuc/X5/EW/ZXK
         e2tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781081874; x=1781686674;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wRCC2WnM2rmyRkqpJMx+C/5ibx09IpAJLZaFTYDrsgA=;
        b=EWQnSiy7qKSLiH/onwSCuKm38yI244kvRnuzZlVO7OR+TtNyEFPbg56tY+uNBaKweB
         tBCg4nJtkQW1kCvyxjYhESpCl69G5qUcbk2/KYadB8k5UrkVEiIylcR8MlYJ2REG75+I
         OQ0ZqEmV9xTjalXrwpL/t8GQoenFZZKF6YbVjCb2VSqqsptACZBQrhkozC3pXeY0PnAf
         8gT8PNFIyqWL7QLOtAePZYTkBI1vX5sfDaABiLgABgMyyz+ld5tQpcqUzxSrSbgHCF6y
         58O5IfcUvIazwE59U4gT9Mq85K6msMhLJuzEM+EorWCGFyNvsPnB9sLktR3Pu2ijvt6P
         aeZg==
X-Forwarded-Encrypted: i=1; AFNElJ/2k1+PLmKnTSgnAS9pgsM27BEZ/jUw6CbmsykcNlLtTMUZiOrSLZE/uFy+bQGTNb88c4vOF/DPreoE@vger.kernel.org
X-Gm-Message-State: AOJu0YxmZ4veZ0kthCuOWJMEdUCVEUcsUfMTqwdlR3KCJZisy3rbi0G0
	EUlVoVCsEX5E85zZpwkwpoSrcNNDvpcLqP9wFwbGQ94MD3z2Je9OPvDgIJysbZXRG7Lw3QkZK8B
	GyZ6qduXezuETBvhpwzoeFb7IkSxX6ofEdpCF9b+VKzadU39De8ZwqzuzQDC50lCz
X-Gm-Gg: Acq92OHQ+RCkwuQ63lZVCzdaHVMoGHHVJPUQOyjMHEESijdjARTLO9yJQSr1iayShul
	rC/rEQGHdYsyug6Ie8iyjVtS7Lqc2qbfvfC6DQqOuCsJqD2tZmvygYAXTTpdCSuqpKKVIHLYiq2
	GxdLEo1FmrW9AvsAtTMkr+/5/Y4kixyEVJlq6M2zYqxXKujnR+Wwt/mgwUBwa9TOPn2GUm53EVB
	tnOzTX7dH+wIdnLrxzamFsfWnSop3GnoiJNOa3CsU+8/H5zyB7AKzsAdz15cy+S5RDlUe+tQuAi
	+9u7aKJ/SsyfAxYFUuJaFXRZbSet2dobvgBgFuViNvIqFYSORjVIlJ61++entvXwolkoCWyOjvE
	AvUZ/1xMoq4EvdNyiUELGKXzjz5cMPdZGHwdFARw6LpKNpDwdFMDCEGtc
X-Received: by 2002:a05:622a:4c06:b0:517:5af6:77f9 with SMTP id d75a77b69052e-51795b3af28mr211913641cf.3.1781081874631;
        Wed, 10 Jun 2026 01:57:54 -0700 (PDT)
X-Received: by 2002:a05:622a:4c06:b0:517:5af6:77f9 with SMTP id d75a77b69052e-51795b3af28mr211913531cf.3.1781081874255;
        Wed, 10 Jun 2026 01:57:54 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051d86f75sm1153724166b.21.2026.06.10.01.57.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 01:57:53 -0700 (PDT)
Message-ID: <bebc6100-bf32-4a4f-b410-84640b817d7f@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 10:57:49 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: ipq5332: Move PHYs and PERST# to
 Root Port node
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260609-move_perst_to_rp-v2-0-6c731523d08c@oss.qualcomm.com>
 <20260609-move_perst_to_rp-v2-1-6c731523d08c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-move_perst_to_rp-v2-1-6c731523d08c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: EXXh-kx_cXHzlaGdtEpp1qr-iKwPbo2A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4MyBTYWx0ZWRfX539sfqAIbYUN
 wqsUcK5sFUsLjFKFQRGBvNN396TYyHlX5J2Vp+zJv+EmLWX+EXozlhZHP1hpNm04wqNGoeR3AWc
 DGuS6HPw6gg94YzoX2BTpx818X/OCAod63L5TeWdgHujUqRTLzB/Jwh5e7pXUnL1V3fPFmq01HH
 EmAnZwEPMdsfjQlYRMyniMHlfwM3lMdyavZJ0TQQshBTbj7+pBGcYRzYsLAG9uuhoM7S1OFkLKI
 K7VSJq/kNoZiOgh4r/bPUqVWB8y2AJvCmgk9TcBQ03ycPoCoDfAx1WmuI+Q9y3VLm1VcCPLV3A+
 SgdYDAKfisVr2h5VialMME2TO5cKciPV1tbTwgfWIdmk6pjJ2xl6cW+TL6ZX1N4QnoFMj28Qzog
 kLn0Ff43g3fmYBgga/SS9KY8NWfSDxcXandRl8zC1atlOkcl8FSzUIbUQz/IGrLvsUdquSYXoqd
 /apSV3SdEBJT8SnzSZA==
X-Proofpoint-ORIG-GUID: EXXh-kx_cXHzlaGdtEpp1qr-iKwPbo2A
X-Authority-Analysis: v=2.4 cv=Md1cfZ/f c=1 sm=1 tr=0 ts=6a292713 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=b_Pr7HiucSRPs_5II3MA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100083

On 6/9/26 7:04 PM, Kathiravan Thirumoorthy wrote:
> Follow the new binding style by defining PHYs and PERST# (now RESET#)
> under the Root Port node. Avoid mixing styles and move these properties
> to the RP node.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
