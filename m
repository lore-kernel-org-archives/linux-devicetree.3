Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3699C426692
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 08:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788768165; cv=none; b=Ilm+1ibwH/TWmLMGpXgkgHlSjsNEvXinyAdSMrNEAnN4uYqnzdWfxCXin+5ZE3/4aXwjw4CNVoGfRMvA1euJYtkGCvkhMZ5Rc6gcZu4lfPGgUjfsGtcGvTcT55BNrkjrpS0k8rnSMxbTKB6D8Eq3bm6qaY/hrSdbz9S4rwRPyoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788768165; c=relaxed/simple;
	bh=Dzxyn31K18wMcByR8vcSiO2kisz9KWfmZLWAn2OFRO4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ao8uRSBAMmBekKp4ycKAd4nJBiTYU3ntMT2lhROpq4B1DH+j0F6aMuKlSvy8ed92L7xom/Lm2RgFn+sjbf9bjyAsDhfosfl+4UwXxPJNQ0lyAnekSHzUqk0adw6zy3Pnf62CsemjYD199qmiEDU42SxDKjkZ3F2ddWma94CMh3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xx8mTu15; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NO0nx8zR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xx8mTu15";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NO0nx8zR"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777fXG2146300
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 08:02:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	etZ+qg+qB0GuF9OT1fMZINJd7O6DGD/wUtAisFXtEp8=; b=Xx8mTu15gUC2hCdS
	d8UrURUu3w9OYN90GrAGEB3UeSXz1oXSIoTqPURho5FVVCp7fhdH6kegs4uF07Au
	TaSxQW/YcLG4LBSTgwq40i5NIrI+krYDB1HVaeTdCbtAyl8q35L4OKa8ooqdM3Xj
	IFVaPOOCsL55IGjSlRvagHxiOCwgUfrXVNjDNB0dXORy33ALxUJcmG8st+luNBAa
	0ZkpG24B6cnHE2GoRRhtA7l3Ogub7z57KC76mC2lt2mXs4I7sjM7x2DsjLSnNihT
	xTXeh5UrjnMIduE7s1IU0ipXA72rr4kKj1IHHYMDC7HBeNOjc92yWoFEKAT0N74b
	/7xBwQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggc8jdqxu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 08:02:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51ca37ce4c3so5193711cf.3
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 01:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788768162; x=1789372962; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=etZ+qg+qB0GuF9OT1fMZINJd7O6DGD/wUtAisFXtEp8=;
        b=NO0nx8zRK64am93qscSzzkrkDIA3fGzUfxAAHXbjEaWxlLZeKQ0DyNYIVr05zJXuQz
         n35mcLtn58gmMrqZufiD+KhikrlqWCbTLMv59QQ4BmSWn6lc/n8XoiYherMcdFIBYc54
         JNuUHtHkEfKxEwuZwq6BYOZDDMqjBByk4zjx7OEE09pe50lv0KHMMrsq6BsPSRztyrHL
         ma8uL7g2EkHIyaRPiDGWOUwLskkrjibTJJnid2s79b/LpRgYERsrMm8nN2yklMHc/rb+
         Yaf1sGwUPEJ+UgnGdNBfrxNsUqHS6s9LKAMl1qEdRtmFjyDIW8LgE6Qq5LkCyrzlkNYm
         E/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788768162; x=1789372962;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=etZ+qg+qB0GuF9OT1fMZINJd7O6DGD/wUtAisFXtEp8=;
        b=AVZHPo54kB3LJ3K5ln5qOuOc3NFzRWB2Zf/OTJxyy5ewn5OukuUO+2ucaLuQSEi27c
         KDRdanTkqSxzKcFyVL/0vtnO3jabnBbm10nwhmTPmJ/R+OqaJKRraYrT7/OlUUC23b+K
         v6kkvKcuxt0vRR/oE0S3n4LXVAfLO1P6ca1HbffzGCGi6ECAE+vp2+BH2DWpoQddnxqh
         N+7rg9/0t72Vgr92SDpr5NS7ieNjHTOkpqbvgfg9L0KAmycr01VF7WmvPCUuSqsiH3lF
         GFZiRU9slZi1DkxIXEI6ZXn275dvxlnt0h34mqfefuaOf0tc/vJyLbo5uKqmwHWvI0Lu
         EAPg==
X-Forwarded-Encrypted: i=1; AKwUvBwxSpQ6IfdU22FSWTuZi8Aa8BLWbTRkFf4RrRldvqnNyYP3NT0BVB9Tmqq0MyPDw7NeSxXQRD7Qr8r9@vger.kernel.org
X-Gm-Message-State: AFuF++kRx90koXtTnjKeoIz5iGmDiZglASGYd5FMszqlcwH49k16zzKL
	1jJsCwUXiM2SfWSAQyUz41XzJHFFfzPWEwf1lN6c54WX4Belim1VDxzcxoXfYHp9xZ+r8YDYHkj
	ejXeiajuJUC0pFvMFA20j0ZVYHe2Pvcuf+QRqwX+Y4yswAiu9RU5bY/tlKTr+OkuI
X-Gm-Gg: AYBFou27sMxGJRoz7a3Xadz4GxNDmSakQOeObwhqCsDLzmaB7vInaOq2kmdD2Ye16Sl
	ELEc9xYH6WedgQyl7HTObIELDu//XFUA54j+fJey06wL6ppaGsQmY1h4ng1gm3BhawvbLW0XXhm
	VnkxutulFG+bjvD8vTJE5/JrmlKlT86+lpEpMCftwQP7ktq4VZVOELzZp9K4DDX+VyEj9KX4i8G
	KXhOr+poqeoMpv9+k2Vs6JnKthlLquaiwReTXoWe5jstKafe4w9pPmkT5jCxkremr+kh1G1U6kn
	nA6mEFfFlIZi41UAOt6eNfMCflhyv5OpZ068exI+CUGxVhnT5/Ulo9KRVguVBuelsn7Z/MOTUtZ
	mbBpDshCpDVK5gLujatX1tg==
X-Received: by 2002:a05:620a:3713:b0:939:b2f1:75d4 with SMTP id af79cd13be357-939b2f1778dmr84190985a.6.1788768162217;
        Mon, 07 Sep 2026 01:02:42 -0700 (PDT)
X-Received: by 2002:a05:620a:3713:b0:939:b2f1:75d4 with SMTP id af79cd13be357-939b2f1778dmr84185485a.6.1788768161652;
        Mon, 07 Sep 2026 01:02:41 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d501662sm433050766b.23.2026.09.07.01.02.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 01:02:40 -0700 (PDT)
Message-ID: <46c248d9-fc74-4f3c-85b7-8b678ae3c723@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 10:02:37 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] clk: qcom: gcc-glymur: use shared ops for GCC UFS
 RCGs
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260905-glymur-ufs-clk-changes-v1-0-cdff2c67a8c2@oss.qualcomm.com>
 <20260905-glymur-ufs-clk-changes-v1-4-cdff2c67a8c2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260905-glymur-ufs-clk-changes-v1-4-cdff2c67a8c2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gC8yXzOmT3ODsCvbr83jaNlF0ftRcjl7
X-Proofpoint-ORIG-GUID: gC8yXzOmT3ODsCvbr83jaNlF0ftRcjl7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA4NiBTYWx0ZWRfX5eesfvb4XE5U
 Mb5Qc8ExB1L6SuV1Jf30uLXWS38YB+EH4zxXigfrdYrF3E6ZMA17oFXs2d3+jH73/wsYLR41Ge+
 eSW5DbPthfPLARbj90skWDVGhyKv/9lqXCccNC21za0g3QYy6Qp27cbpwohXfb9gfccAhucKhZF
 e56YQkdsD7JttrPm+yJ8yAzM5F8psBbnzGrNmU/G5tCYchS9+sRLCx9agaul2CSAUtldGXfSIYX
 UgELSvIusvIdPySucjg2zPCq0LxfUm7UlBW7y4EiLDsiWRmCT5R5syH8hUG6esUQNwuocqhJFUG
 QDnhO15YeQMQCwE/IhPkuwU6sT6VmkH3uuK/+Iw2sVhS41o0qZXIFQrYamxoi/m5l2ZPLC4NcFv
 75tU2M5n46+MF3jpyU15nJ5mNbujK9cPxvNP01iHWcJbXoR+AXlim1KTJpFtlvIM1gYMwQ/rGa6
 WmSnRoTC8sP96ygEWiw==
X-Authority-Analysis: v=2.4 cv=DYgnbPtW c=1 sm=1 tr=0 ts=6a9e6fa3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=7NOcbVF-i3gUCoNk4r0A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA4NiBTYWx0ZWRfXzVszqNwNjbni
 xyQcLo4+aNmke2hK8n4huZk4JrIpbH6CVU+DIA/AAO8OUoQQ4eVK18RA2DzsutWjjpOoBSWlmKA
 eKa4fuyQ/L7wOd0fUiYPafBQoAK/LWs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070086

On 9/4/26 8:50 PM, Jagadeesh Kona wrote:
> Switch GCC UFS RCGs to shared ops so that they are safely parked at XO
> during clk registration.
> 
> This ensures the RCGs are connected to a valid running source clk before
> the UFS GDSC is enabled, which is a requirement for the UFS GDSC power-on
> sequence.
> 
> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---

Is the no_init_park variant an actual problem here? When reading back
_CFG, is the parent preset to the UFS clock (which isn't running)?

Konrad
