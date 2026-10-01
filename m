Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5733AFB01
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 12:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858562; cv=none; b=ct/hoc2wegFDwIDMgVtqWb52x6dmvim+nHrCZTs3asYmLlPnjL7bTSSGX9EPy0RPPBsMlEvYB61nt0v22NyyE+Y4N8Z2pDZEQu1I6Cf0rlFmA/tXqzi7XsjFiep1JGqnYBGsC94vcJa2T0BXcDmAKfXyYfy00Gm3Bj7gAD9kmyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858562; c=relaxed/simple;
	bh=sJrCCX8tcWClNWsB9aBPl/sbOgEIN6wKM2tSio4UL+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OqWceoJeXcmkn/V7YPGFZyW2k1onKtSdtL1Wh2FL0k48DRVcBFcnpNk5rVMUAbKHmbJ1l1g14r3qh0+JieWolAFyNFnnAme1PKIzWcbjOnLAXsVBLIWIkfcya8SmcFKLGf5EAHYXN7/eN72Sx5VEvD+FBciCevU5+FjhCn3xdbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ebqzBtb4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OfiBRmsI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ebqzBtb4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OfiBRmsI"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xf8i2176996
	for <devicetree@vger.kernel.org>; Thu, 1 Oct 2026 12:42:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H1C08/BFJu+sP1f8Bo+zqaA1pm5ZDOP10ddNZOYzauc=; b=ebqzBtb4eUNkMlVi
	NcTjfjQgGqQXTiPBjyQbvyVFY5R2ym4Z3HhPvALAPuuSNIGTm53/8E5dZqPIe2h/
	Hm6jUfFwX2u47tU/Vy57CoiuGMQsWmzApOz49ySvNV0GyfpGHvhFVrl/f5Z8PGr3
	aLIWB2vGucALMRNzdB3188oZrHJc3eTVmETDEQkIEmaqNyCmL1VP95576zHH/XBX
	WCMNu+GsMl/PAm63rezgfFZMRXq/U00o5p8wcTafn1p/2Pv8I9LtoZbvmynnIHuC
	CpxTMUpegYbI+s7Uf8UJlOW4/up9zklXDmt7KymQ7kCc/WECzy49zJ//LwqTBqay
	TUAOUA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1h7nsucf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 12:42:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939fc317691so120346985a.3
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 05:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790858559; x=1791463359; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H1C08/BFJu+sP1f8Bo+zqaA1pm5ZDOP10ddNZOYzauc=;
        b=OfiBRmsIMnOTNZ0rqliK1WdsDpFS2LiCo5Y/daJs8cw4DUaOQhmoEdvqxxzfqBS074
         2F8RQBevYKRZMdIJfPaCzOED1hGAoxL1JsehbxDn1xk+GIWDYTGz3BcNAsgitK7REY54
         MG47UmUlR3Lb8uFVULob9/mtVl1lpKhOqz9sLU0WL4pM3taaiogtoRp0eIoZ1C23NRVD
         hMcXoZraZPe9fJkGgm6rB8CjaaguaPUpZm/V0Q1O2ht4CkM1DsFzNCiQRAOnqOcrrcq+
         IJ06h285SLi8YhMKMDGHINuNA7Fa4tSTAwuWPO8mEkxxwhN01kZACxrwjXfmmBNu3Sjh
         N/JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790858559; x=1791463359;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H1C08/BFJu+sP1f8Bo+zqaA1pm5ZDOP10ddNZOYzauc=;
        b=XUMwx634L5CkHNMJefrZVEyWHIYwT+KXB/umYSuC9Wkiq9KbT6OFSDx7Hqazuzggvi
         t2sM2037IF82Tu49PXMgxaTSP2bMrQYWMRerInc14MDIhibpeIzbrKqZSD7eBbhIXQJ7
         0QpVzq3t67JFJtvWssCDjQxp8KUj9dTehTeSO4xP1+Rme5x4FNI0anvRAFeK0oGxKXcV
         K4/0fTOvbKWGOXt/IXlmFe825dhHJqtcz1y+KR3v546rj10TKSj9GUm8JjdYu4669zpt
         oqpQcMqzc8TENijRF+OiEjNhNSPeNfyE+YZwqoOfakuzLhKNFrnobclqFpxzO97KIBYB
         Puug==
X-Forwarded-Encrypted: i=1; AKwUvBxviI/ELnjlHPGEOAHyPM1d21hGTPyCcIbl1IaTrARRh7RziMMmxn4phjhpts1aiq4kDxc5QSdhdvRq@vger.kernel.org
X-Gm-Message-State: AFuF++lrzxKrphUATjaJMBPColvHp3X/iwlqFYYnlzeLcYeYZs2v+QmZ
	5VfPBtgx8o77tju+VOyeYaL0yflXbiR/gGiVzm8a1XZx+EuhnwIxstN18LYFfMRgMdcdZq5z0w4
	dJEWxagE/97nFUn6XlgZY9BfJowygNwBHP5Vqy8CoMFfahtUdY0iRdX0oJLnRDPd3
X-Gm-Gg: AYBFou0QvX53+vWpTgcoPMQojlJOrM7braXgCmD/WWazYWFLHQVQlBLp1zJruGLXzvb
	BAYi4gYDfT9a3VEasT/8Vw+X9OcWhvJ6TZpC1e5wCMRl53KXid+MhCvtV3jSFm5x2DMFKSxb1s8
	fZg9npJLHBryV9foxpXNPoWUESo3xvMph3kTtKRdFublYHU3qdXYkOQxNos/Hmn8OV+lSbpXIhd
	rzK4M1lXMPno6BqH5EZX6Wo6qcImlEB3cMqUIbzmgOGk0UD/noEmaHC0p62kC1IiTJdvgKjXj8g
	hJ6MOJN8lnmVr8CYQjIoYXe+U2xZ9moI437GET9iHYsIMHOkLb8xc6o96ucAukCHnFntwi3jZ6E
	qpmVoPQstYyRjAacmT8suwg==
X-Received: by 2002:a05:620a:3195:b0:93c:5bda:9711 with SMTP id af79cd13be357-93ca980894fmr853051285a.6.1790858558448;
        Thu, 01 Oct 2026 05:42:38 -0700 (PDT)
X-Received: by 2002:a05:620a:3195:b0:93c:5bda:9711 with SMTP id af79cd13be357-93ca980894fmr853045285a.6.1790858557821;
        Thu, 01 Oct 2026 05:42:37 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31c93c31sm151473966b.11.2026.10.01.05.42.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 05:42:37 -0700 (PDT)
Message-ID: <e5fc5d23-d6fa-4b57-b6c6-a7ac64412d15@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 14:42:34 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sm7225-fairphone-fp4: Add AW8695
 haptics
To: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261001-aw8695_haptic_fp4_driver-v2-0-1bd38b1943de@fairphone.com>
 <20261001-aw8695_haptic_fp4_driver-v2-3-1bd38b1943de@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261001-aw8695_haptic_fp4_driver-v2-3-1bd38b1943de@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OI6yTiaB c=1 sm=1 tr=0 ts=6abe553f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1MCBTYWx0ZWRfX9GV5hJjG07Jk
 PnUbWNc9byTRrU45mDxeoEXpWGgy2FQ/N4RKxGEhph/XhviuolZfz1AmhYjh7kZCI4gYVoNhzle
 8ucCAXbGimnPlFNjf+Ho4Z7QfyiEiP8=
X-Proofpoint-ORIG-GUID: f8hNdjJMM6l0DImKR8E9OYYDZZz9nmO9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1MCBTYWx0ZWRfXxR4jqE7QnY5N
 qFuQdBo8VCBElZtaeMGPdc3/lUzo066c+mX35STcbXQVLyTgPrIJkg6rJuodq0hMHZK5qtBLGPx
 v8kaaTYdt7hR+ccsgMpnRwgypcdTe1SaNhvmz5PWi78qmw1WasSYRdneeIer+K+NrIKp6s2AyK2
 dTjxByIPq4xzGWtHtwXIy5FzleKQbI69D4CgZ3aYg+43gnx1Svu/DWslRZeSzGeQGvRh5DB+NHM
 2ZjLjv3d1mv3M5gX+IiYk8+qf1UR+vBhoa9EeWB1ebHI3tdnfM3VdNllWs7IcJ8I3ZWtPzVAD1w
 2smiL8TJ2pCznDxzBO1+vzhZ8Z0UUa5QSF+4XCTiy4VC+bcTk9CEhH5xuVnSg0RCu+YZHDZLIzu
 8282HT4WhlU1G6/2qwrKYvJwpTbRVp9cggLJ22tom4kPhsVg9rRZbWA1otEevtQDftUgBeQwqXk
 9bZYYeNhWsJ7SSkNa7w==
X-Proofpoint-GUID: f8hNdjJMM6l0DImKR8E9OYYDZZz9nmO9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010050

On 10/1/26 2:38 PM, Griffin Kroah-Hartman wrote:
> From: Luca Weiss <luca.weiss@fairphone.com>
> 
> Add a node for the haptics driver found on the phone.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> Co-developed-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
> Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
