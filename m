Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7BB17C211
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 22:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787093193; cv=none; b=AelrFstviVBbWuLPOm5XNuXnzCUwznPUFfFPoB9e0Y2XP742qNYIouE78b1wA1I6YgtzMh2WPDidOm76wJz+rH5uMyhGg/D3mzWxbXnQxZA7b1IU5pSAypHvyQiUGfE55pXhiGe3Nh5FbkXBg8ObWlR2UgMICZi77tSnkUTloe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787093193; c=relaxed/simple;
	bh=eFApLOZSBWmnyY2TVhSVebEYE61nBEFosb9Fx01D0uY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=deRZYUlnzy+DPb9S99RFdBoYUvbCiIRQiDwZNPEuPX3SxTgg+cjfqrV60mL6PIavs9Bepbb5OuPzAlLq9aGJbBF57cmlKOQZSwC4uPazvT/FjtwtdlZbEWw+XwuMRGGh/U9xz0paPIuNkdaRmynBDVSdZhRiBo6CJhD3E7zhYYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EDtMXF1+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SULWd4Mq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EDtMXF1+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SULWd4Mq"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ILbho62428210
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 22:46:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Sh8SfUoyQJ5P7UWeAsnoUQ5a
	U0smLTQMJZkEtwRw2Js=; b=EDtMXF1+boidpuuqs3joyB8fcnHZlpC9Oi79ZT17
	KUdLDog8tdtNCQdcBcXgiyv/ES6Q37OuZXlNeh1+472oKmVNv1nXXM1RvEAyBfn5
	P2ay6xibna5oRUjVFk2nee6K3jLVf9wpnpexUZ1r7Or85LAXbKSgmblTVGb9AH8S
	U0s6kYzwNVhEaCFNke8TLYHG/VwTy/G54ALC62aAv3KmmBp81aWsdG4jY/x//VU/
	YBL5lD3Wv5PqVWotgLdWYfxI4rltkMjpE/eVqNZp4PU3HbQPd9kXKoBo0ctkIHv+
	R6jNMzoHxK8gk/zB0ZhrmeP1/yKy2AI2ef3SPKaCmF4a4Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfn87x9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 22:46:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e5fc4c7e9so57433885a.3
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 15:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787093191; x=1787697991; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Sh8SfUoyQJ5P7UWeAsnoUQ5aU0smLTQMJZkEtwRw2Js=;
        b=SULWd4Mq3qD+vhmtRGTgX9YMNSeM9HL45STlk0XCIZMNL7kaImVfsJ5d0Jhyw5KI0L
         W9REdT+jO/HhcvSHeyU4l2Sy9yjhp07RANeGLHGeG/UP3EypqmAa25hg+ZQH74K06CIX
         HVd/hmK4xITJX/eYXlT/U5ihWUlD8au+05SOThpSgw/9C+SsYgxqmWv8AYkmrpmXQBfe
         fnUM9VOlQ7D24aXTQc4VGJXfJrK6Gmtnj6u+ICwtQ9CZfqCmO9DfMMgaSHYHU5sWYcK/
         ox80fYC2gTtXcHXv2GjgEG93FtW8nrKgS0CnMxBGH9Hrhjc+kNmfZUpkUv82ZQYvAgX4
         97Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787093191; x=1787697991;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sh8SfUoyQJ5P7UWeAsnoUQ5aU0smLTQMJZkEtwRw2Js=;
        b=bX3h4eKwSZ2GVZAiFQpe88H38QFNtp6BnxwFod3DkVrMw98FU+fTfKnTkF/jMtDJUz
         /0UQItoIzXw0dllHrM+Dus1zKDEww9VOIrS4LfCOACVnHdvVCybAFDNWpjkE5HuSUSid
         dHwkhCBggByMzDFzx/degLGMD0/sf1OTpubAtkJe09h9b+ELpwlTXGSy2uJodQrEgtYz
         Q7dPfKnnnBrRr9TDTGlorhuQxCBuha3cii40Y/hqKtYcxp5s+QJ3lv9ls9sQO8WUnpFb
         6sTeulTDapk+uxFgNoqYMU1/DeKO0/hN90LwCcNmxF9wSWvt7NC/eCGn7NPtm3/619eo
         S8mw==
X-Forwarded-Encrypted: i=1; AHgh+Rp98OPaRGn5fdkChA9Us8dfJTOKhKxP8h3lw6inFfxsGLqYUrgRosBnQML6Z/mspBNCBdbuZTqkao5k@vger.kernel.org
X-Gm-Message-State: AOJu0YyLXlpXwLXAxEMHFghGBHSQKCZcuTHVwkjHiqA2AD6lGmzt2DVo
	WbCK9qZo1JJ5W/A7XI03yFODdkaGl3RiJYEU1CXd4wflP1IN+N7i3S30QaKwrDMYHSTxUnPKadV
	OgLTwTnORb2U9YQsX/UXNDkiJTagHh1rVTHEqkSuFUMFhO02wpi7mVZIwKxnn86g1
X-Gm-Gg: AR+sD13JW0yDlybOZBW+mf6WT9niPM9R+XDOAHs6Q22ip57pw9djupC1+j/6aKyJBmj
	hF0NIAbG4AK/zg/1FQI0uwy9EDiyDYfeS4DC9vwyAnluvRcRvhcd3jxJreDNmfXODOzFnX786a1
	YYgR9ESkdN4OWv1duLRUB0zhGDjb0lp6l/rqknAbifLBtGU925xxDwFyvQFSGbJl+2GCQSCp21t
	TEaB1GISmdhXsi2f/+7GiCN08PCUohOzX3CVZmVmsIz4VZsBivoFb27kncsRgyCycANaRUtxpNl
	OFUVRmk+5k0PqZu2uiPobRkK7mNRecLCz41SVhd0QkI4RtOfyZEvdyQq5ZirioSRlV7lxr2bczm
	ur5w34h8ID8ACDgJtIHxyCZEpDf9r0ERjcH+mp2eVkARlnHJDTAF+n6cqNuZX8D3aYEytOlRU7O
	sh2wohx+0+VMsR
X-Received: by 2002:a05:620a:8011:b0:936:c6da:13da with SMTP id af79cd13be357-9371e2cf786mr78346885a.4.1787093190586;
        Tue, 18 Aug 2026 15:46:30 -0700 (PDT)
X-Received: by 2002:a05:620a:8011:b0:936:c6da:13da with SMTP id af79cd13be357-9371e2cf786mr78341685a.4.1787093190067;
        Tue, 18 Aug 2026 15:46:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b478860c85sm40314e87.35.2026.08.18.15.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 15:46:28 -0700 (PDT)
Date: Wed, 19 Aug 2026 01:46:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        stable@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v2 2/5] dt-bindings: media: qcom,sc7280-venus: Add
 dma-coherent property
Message-ID: <2eg3aiesmouwzvdc7zbjesumsyiqnmxhc7ytwffzfn54ss67dh@wahz2pmmxssl>
References: <20260818-iris-fixes-dma-pseq-fint-v2-0-8dc8c4b3880e@oss.qualcomm.com>
 <20260818-iris-fixes-dma-pseq-fint-v2-2-8dc8c4b3880e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818-iris-fixes-dma-pseq-fint-v2-2-8dc8c4b3880e@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=QedWeMbv c=1 sm=1 tr=0 ts=6a84e0c7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Z9EQ8daeuvN9kbJAhMIA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 0VeY21CrnQahOW-W7kEx0oCcKZWruN4j
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDE2NyBTYWx0ZWRfX479Knnw8ydE0
 +dUvaIIoYWRpwiXHJHYHbyw/tAuxH8VtKQNFHjYNo4tPQdyp5ozZ86FtzNn630AqtaJBk4RjiwI
 EcJOyXWx+inrSx/7X8ZVRz0VameSIQs=
X-Proofpoint-GUID: 0VeY21CrnQahOW-W7kEx0oCcKZWruN4j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDE2NyBTYWx0ZWRfX35pXllpE26vX
 f45lSj6H3tw+OdWLzhXT1b+LGl67bJI242GFptva5gdKlRkrxfQYZV3PZt90NDLPmIhyPn42kF8
 DU3nt5UQpBnCtxlLzJfYUYLwl+TU7/hA+OQ7Y70J653mhCv8C1FenKuP71rFg0xRF6j+JaJuhKj
 7Q4Sm9e51kh67eZenUPyeP3Aj4FtLjg0EcB2Xc4whuuwEt9gcji/v5ofHpfWmGz4Tg7Vgdz/jfw
 2modksEi4E2fsm9LAh3D1PK6na9h50siIMnAhgLmD6rOXirtjFS3cWM2/Mt6Ey9gw4Y1XkWqmyA
 BgrC1J3ilXOEpjIYQWtXq9d2qntbYBm0lpXdslJFv57KrL5Sw+xsBub/Cjcmi7vCTF7d6tA5GwK
 PpQP9ilJ+BPItj23R/hs8qpwBYpwHiWON3BBJCad7dmP1BjwwKu0nQZRpMjOfMOXM1/q8sHm4/e
 tLhLMU0Tgvrbg5rwKGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_04,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180167

On Tue, Aug 18, 2026 at 09:24:15PM +0530, Vishnu Reddy wrote:
> The venus video hardware on SC7280 is IO-coherent hardware: even though
> the driver does dma_sync*() calls for the input and output buffers, the

Don't mention the driver wrt. DT bindings. Either the hardware is DMA
coherent or it is not.

> venus node still needs to declare dma-coherent so that the DMA mapping
> layer relies on this hardware level snooping to keep the CPU cache and
> the DMA buffers in sync. This avoids the unnecessary cache clean or
> invalidate operations performed by the dma_sync*() calls, which are not
> required once hardware level snooping is enabled via dma-coherent.
> 
> Add the dma-coherent property to the venus node to describe this
> hardware capability.
> 
> Fixes: 37613aee2179 ("arm64: dts: qcom: sc7280: Add venus DT node")
> Cc: stable@vger.kernel.org
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
> index 9725fcb761dc..cc31f3ba7e7e 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
> @@ -42,6 +42,8 @@ properties:
>        - const: vcodec_core
>        - const: vcodec_bus
>  
> +  dma-coherent: true
> +
>    iommus:
>      maxItems: 1
>  
> @@ -85,6 +87,7 @@ properties:
>  
>  required:
>    - compatible
> +  - dma-coherent
>    - power-domain-names
>    - iommus
>  
> @@ -119,6 +122,8 @@ examples:
>                          <&mmss_noc MASTER_VIDEO_P0 0 &mc_virt SLAVE_EBI1 0>;
>          interconnect-names = "cpu-cfg", "video-mem";
>  
> +        dma-coherent;
> +
>          iommus = <&apps_smmu 0x2180 0x20>;
>  
>          memory-region = <&video_mem>;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
