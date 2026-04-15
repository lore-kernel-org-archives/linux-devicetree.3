Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F588391E44
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 08:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776240319; cv=none; b=F1uyawLILIVVZvJSNVEmfXWl7dwgfGhCoJOwaWsvSlb9CW183dGHc8X9bgXGwm7oOfM72OgTdqm0N30J59YyOIb0aRFsvxxHGXud+v4EH5nes5Upr0kagIqk0FgrbQtGEAk56L/skrndcehe8yh/t6/rK+B9s32IHAr1oMBCVwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776240319; c=relaxed/simple;
	bh=FsMYiBXlhDeyE+WBeLh6LxOPoYa/d4x2LdyGcGWIHME=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lcZml12gWni1TDDC3ukSUGMSxCyUpIHg1RVE9sGW2wA6nQp9tavWbAzDLx8qU68Cn+6VQWVtZLCS5QYLdzk90Tne1CPeTucrCvR3WOzafPTd0DuZA/lS59IJr7eg2Kf1WgVfoFw6qM+tWjbXndAG51JaHpo5cbjKCVZiSzkL30Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sr8A4/qv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iOpTbxkN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sr8A4/qv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iOpTbxkN"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F3g8A61701733
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 08:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WvTHObfvEHkHc3k3Mpuu7bQ/A/8paw0PCtT4c0XoiDs=; b=Sr8A4/qvUcdG5358
	g8PvTYXsOfY/bCi5IKnt8Wf4SgJ8Tqz5gWk0A6bV5idcrdCjazHxwofjQlDnC7eu
	Sy46jsWoTxIbDgnzTzUEBe0NQISdHXeCKuUU18JHdNAI9LMKlhpyA5JTCdxO4QRv
	blzImh24CxDXHnOwhRwZlGQkaPh0siiHM40SOdcd/WKQBVxBPRVQkeEskiSgtLLn
	xU3sbh/bUeChGNeFmBibbpK1hIZcfhneKx/9inKGfbPXG1etyo40/1RfHT0zUl5C
	+0SWiGsr6WxxVpI0jlIDEHn/UGN/+ynsVUJ+kc/qutzAzRC1fnNfc+5UD0BCUf//
	+zsL3g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dht56taum-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 08:05:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb39de5c54so149118585a.0
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 01:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776240317; x=1776845117; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WvTHObfvEHkHc3k3Mpuu7bQ/A/8paw0PCtT4c0XoiDs=;
        b=iOpTbxkNQ6EIh+YQFTNNewBQsh9HowjLaBWchYr8IOAYqjx1I0MJzxFfozo2u/6PDQ
         RS8LAK5spaIkfNiVe0ZPxEGuO8YGD4Mg5Ko6LWjTvmy/R35cd7wr69VIlMtBXdiXkDfc
         cpSqUbmXMi+UBmNdDhgWnizZK+dg3G0s/meFIRoU3ybjd+A5fdUXPQ9++Cm5kWkiCLr3
         T4R+HNhoXfk+zMW974TynDP2HBDoiNLJ7y1LvoGcx6jKOwT3OiTrdxWBOa/lV13qWRUI
         go52IqTbfn8zKQWrLYpfYkJCf67pTqIxO4J/q+l4rJz93MKC94vO9eOM0ERSl+EuPudc
         9j/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776240317; x=1776845117;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WvTHObfvEHkHc3k3Mpuu7bQ/A/8paw0PCtT4c0XoiDs=;
        b=ZTdkeD3ivkH7nMRqU4qhSOAs9B+2iZzd0EVc75/NVlsw95T7vFe+MM92nWtaO9wOof
         DZnDFPN7b4aVwdBZu2wDvEdmaP6plAair+eEj5du1U3CiB+B4vfFZA7L6YRAxQJ4Uznt
         bf2Gb+C0F0ZkMrubWIYUqrBHLWsoTQcRKYXcO3kpd/oxOd2I7CPRYm58UWFAshS3MC0x
         3dSeY3W5rovR+E2Kx6cy1U6oGRN2S9/cJiCJCDANvQjwevEedV59WoI1DitxnG40tt+j
         6ILl8oGUJgSAbCZ+w00b3ZI42ElSqJJOOZ0iiCcdxvgGcmwYvEEZMDNLpOOoCt7/TJh1
         JYGg==
X-Forwarded-Encrypted: i=1; AFNElJ+ntK1vpFnd+2PIYsxqtKBF7zaUR9aY6stDTbWp0dLZn4DngGhIIW3Ph/a7E9xTBICOQV8MCBzXmPD3@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3z2joUkmtPI1u5mUBWtFxdoZEh2n3O37AQWXfvXgJQqQEDhdl
	vY8zieaKnYag4L2DoZ+2QZX59TQYTiy2amgGFiLWl63tk5UJhR/hlLEZcWkr03KZbJJrLelRZRf
	vuXZjQtj9rujmzW3e/gqTYji5ZZC9zAUNphuVVeFvbzJ+92ojrtZ92n96bOpQbOeR
X-Gm-Gg: AeBDieszsjXAEyQeSQ2gGUxC2Juq3a7StY/QpgWdNEATU9DKeElIx7ofReloMe8jxpx
	btaC3PgODGGDQFwY7rasxBiAgTOurvmEMsBTRUdF/cSkj8nrAkfHwa6a2qihXT8dKOfPlBS29XH
	IvVlDCdcY7EpHCnmORowNaoxbIv/gUJNNcvU/9RDzt399M25Did+qm+Rzb6mVdCpn8uJ3h29NbS
	08phfk8NmvGDYkDgtBdK4Se3YglJ2WnuSuAYpJURB+ag7TBLADBS05Yvk7X8Dxf2rpKS9EJOomL
	uzY0+K/E2Y0E4BipRjka7D37XCLy07LMIUas8AyIBJTevxa5yHjfnaFnvfE+MsZsmpyCQS1g4Nq
	gdAxEzdRHUqu5IOlA/zCCnISSIprpRDgad/8j4L7q3hCqph4YQQMV1mM11y5IU3kHCIoz6cwRCk
	EnT4crl63Kn5qLvg==
X-Received: by 2002:a05:620a:4609:b0:8cd:86a2:340c with SMTP id af79cd13be357-8e4c989a2bemr153664585a.1.1776240316563;
        Wed, 15 Apr 2026 01:05:16 -0700 (PDT)
X-Received: by 2002:a05:620a:4609:b0:8cd:86a2:340c with SMTP id af79cd13be357-8e4c989a2bemr153661585a.1.1776240316084;
        Wed, 15 Apr 2026 01:05:16 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6723800060fsm186930a12.24.2026.04.15.01.05.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 01:05:14 -0700 (PDT)
Message-ID: <f3c9aac0-7260-4f9c-84eb-46d18da60a67@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 10:05:10 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: monaco: add GDSP fastrpc-compute-cb
 nodes
To: ekansh.gupta@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, quic_bkumar@quicinc.com,
        quic_chennak@quicinc.com, srinivas.kandagatla@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260415-monacogdsp-v1-1-077ded36c7fc@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260415-monacogdsp-v1-1-077ded36c7fc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: VrGPIiXJPPz8VM5j4ozvfhVvsc4IvBP9
X-Proofpoint-GUID: VrGPIiXJPPz8VM5j4ozvfhVvsc4IvBP9
X-Authority-Analysis: v=2.4 cv=K9gS2SWI c=1 sm=1 tr=0 ts=69df46bd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=5opoGVv8txePf2wcr4MA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA3MyBTYWx0ZWRfX2mAFZMl2t7M1
 n/bLzufsGlZ/XNr/QMm6sdO9JBzyAhbn/NsZ5C5Ilg2/M29VTMMfNm6CpHOU2prL72afFrTtdDo
 NAgHgrcPwrlpuK2mTA0uB96fpACeCmJIygoX4gkWRcOkaqRyqQrcm3HNr0wtpDt2Odz3zu+pTqO
 +yVKaxCcuzJL4rhMZwcUxQoIKxloDyWwB3k4sUZcB07XADTwRbj+nOg4Btl0/vuYUeNiU1ckgwd
 LcanRuBJE6+UkaDSNGyBWewJMjpAdANXh8JUrzmiCtD7HYu2jnzzeN2tmcDlpiV21cAf9gzeeeq
 lo2H7TJRMR0S3u4SYr5Ye0dj01HE7BqMm78eTEjtUe3fV8hCps8HeikTXaBi2FUAqTdLNytxHG4
 k1Os+PFV+698FuYjclmz1uLoq6nZau9mJFZrm2EfCxdIhWToUyU5ifJqhXlWD+TWKhVDukM5VKB
 hNdVC3WXYDXpqf4SYxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604150073

On 4/15/26 8:40 AM, Ekansh Gupta via B4 Relay wrote:
> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> 
> Add GDSP fastrpc compute-cb nodes for monaco SoC.
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
