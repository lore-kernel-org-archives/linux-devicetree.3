Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793822185;
	b=Tce4prAtaIw97KGvgruRLB4/EgHLCgUKDz0BsE1NFUfLYT7fsHkrEI22Bh+PtHQnOz+0
	 hMv91B7+CdO0yYn3SsLlKqDa4MI6JI08Y/sdfxj/PmDGaKejLHf0mTeoN01t/zvNWoB5Y
	 MnEGUHWT3c3E/oM1VwFl1RcvnjYJAindMemAnsFCK87T+S4I90zuy76sb9JzKLFa381nb
	 LJDBnSLyGd98kBBjb/gTfomfeNm635HoFOlePgUr8Hnqo+ts7fh+4amxL6KBzgmhyKpOx
	 K6agtu0QkaSEyHvKH88yjNRwufUO3m4xP723MOtVWbjk1BqSLCijs2qONV3CEFhTMxw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793822185;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XQLFdhGEl+gprzPQzW/vHtrpFsz2rxGpuBF5QN++ENo=;
	b=zZI9lxJWrE0iwHcHRu02p2jiR5vR6Fal77eDZaxDP77e/dOQYoADhQSXp8co5huciKlT
	 Pm+cp61aUL4aRmAb7O5SfN9WFbOTtNWgid+yZ40XixDjFy6gnrv639cUjXAx5XoM6lZTU
	 TzXZ2Xid1VeG6TZagw0A18NNE+rUly1xHwAtn/UQXb82iMre5UzN3OppC4zxnB2VSuG7q
	 pOoQv8O55d8vDfxSQqX3Iq1CQfKMrpkPISnDQoXU4Ms5zao7ktZczqecJ5xS1YJ5Dbojl
	 hZMRqRYpWzJCt+fPgFY7KnNYy1/LYUUbscs6d4YrZ5S7rqWLo/P1NB6pyz9bEKG6XzA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c135YuXN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eqOZLSbH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710D9609C5B4
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 19:56:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 710D9609C5B4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c135YuXN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eqOZLSbH
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4FjLb33209000
	for <devicetree@vger.kernel.org>; Wed, 4 Nov 2026 19:56:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XQLFdhGEl+gprzPQzW/vHtrpFsz2rxGpuBF5QN++ENo=; b=c135YuXNvYw5b7BG
	fVpcjq7l4pnnMIm1qG2GHUJgCNnlfn8jgwbzvgnRYJPp2KAFBemfPZxq2QR18xkT
	0ty13cOiwNnHBANVNz+7DFgKWTNu6waSuk3O+FRzPab8LVWh9uJB092CYHSObM6f
	O9fh+BI4vQ/HGdk4IEr5EwS/pQ9e2D/RdFqG/w8pVdW8sXvMR5PivO5aKBxvUWMa
	qVnau7cRVYvhT2zQOaZMsQCrnGvMgkBiRLeCYvYexLRKu6tx4XMO1t40H46DhCgf
	9fs+ZxOvTPSV1gDMXEF9HY+NLzQIn8htO8rh8DpFQCZrRnNy4hQH3sXhszpcY2Iq
	/wjQvw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6bj1d5b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 19:56:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9440b27c1feso234056485a.2
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 11:56:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793822183; cv=none;
        d=google.com; s=arc-20260327;
        b=kplXoSo/tNFDrPDopesYZZOjpOD4SdeRPo85ylMYFNSSNHResiur6tfLf8c2K/IQcK
         xaNSJkOrNVBZKQFEswBazV5AQpsI8GM83cJVRwPXa9nxO0IXivkPpx8quMrhbV4ClDHg
         1lp1RuLh+lbNHdFw3qJbv2WhsU/T2NgZxtXT++cY5WYIF9oH/qAw7S2IkHokIzM7YIQt
         KVvGpDgWlI8Cu2/zLf4pkT6ae6XTyquL4y0QQg3AmLBAFVqf5nt1LtoEYlqC0dBDwU+I
         D87NDbNSxkV/fcpoaaVEOH42IPX0z/7d2E3uH0ATxTQNFoXGPnCRuX2BYMo+vWRM+99D
         VH7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XQLFdhGEl+gprzPQzW/vHtrpFsz2rxGpuBF5QN++ENo=;
        fh=JtW4UprFeGilFq4FordM5EWu+6KYaGw8koeXAKrf0V0=;
        b=PFjksjeaY+RffXFaSxyWz2zPlMFvZWqN74ws4CjHL4HMgcc3J18o7Zy1tUSr81Z9rQ
         xb2Ap+vX3TbZqX8Xtg0t0+GIIr1HOHpWkM3UtGUq1VtNU2D56zHqn/QWuBpeyraHtO8O
         w8ML/U3zA+ceYf8cPn91rTcpArTn8ptWjaOsYXHiNrSouF03l4nu8A70FRtphJahgyf1
         qgOi+fs5IG/zanHvJdB12xouc8nyWbkegNyfXv6mR2A0vLMFKqhZJxvydShESigNsSEW
         bJnqu1X1wxFQPNKNCSQVr5OVRke72rTCHkc2cLACIKQHEKSTe5fCM76uswdprD5ZS6Su
         whYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793822182; x=1794426982; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XQLFdhGEl+gprzPQzW/vHtrpFsz2rxGpuBF5QN++ENo=;
        b=eqOZLSbH8ybnZ1liGR5R+MXDWzzAitssSoKck0bY3+IGkBQ/bn79fJ4Gt9Z9Aqzzmr
         4Pd+ySHQagw2SirSyiXhEHwsvhg8jPgHJNLjsJ0T7ghYX/sPvseCsnRsLQ3BojHc4BVp
         0lyWiqgGE9f6SZ08fE9wiclK/zpKnS+9yp7iTEYH66vi/DDM9pEVr6kBAyn9i7MVYgJe
         RNfL+HVuXlelvEeYklby5hA9eRK3+IlpdEiNRjULtsJM7jTfT7H4vTcdNzIZFfE1SILS
         MNq9NdYYvAL+H3XfYCuf5XSskAIPIaHYUZc86o+NAOgokuOnfkgkOVUhmELzjh9uYv1O
         T5qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793822183; x=1794426983;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XQLFdhGEl+gprzPQzW/vHtrpFsz2rxGpuBF5QN++ENo=;
        b=fPTc77p/QNUOGNvaLv16ZUxQbx1fiY+eNlCILWjoOsfWXQzRJ95wfy3GcSMB/TWxC2
         4fipfcmnaA2JIXyCgbWLyjouMC1DvJewS938eDL22Icy6ASr7VzCZVkq81USHwYN+el+
         saz7c1jmAHsF9sZdBiD3t5m7/ncE8WYk7S6BXbyamWNrGd+w9X+fvAMNmKYVtQt+qtWj
         7Ci1YgsaDA2l61TUPNRavdutrs/uloTNi3bHIDoMNoinfrDSPDztBYZ6758XnGtleDwI
         BDa6NMXueQnlcHUXE4DdCQH9C4JTrRmDcvSciM0rKz0Lk6N43Ya2XHor2GCdSJnz1jGr
         qdgA==
X-Forwarded-Encrypted: i=1; AKwUvBxN8fFZB8Bq1M1PoPhMyGcJegdpjjyW6BQsFZnO1ya4HxQwPnc9WAgrgPTrwFcvTuOI39ZmEXqZidAt@vger.kernel.org
X-Gm-Message-State: APuU4Z8Qezr6HazsBCyWukxro/fYRXkJMWrOYmZrBCAhqv04ZT8Dhzsk
	ZRu5XIQpG8Q/4zRs10ItbW5lJdSTUkhyTGFKjOY4yPnsp5HSnBAa58nX6/KgFetbOlFa90xQZhh
	duQ0I+cr7ByTgyGwZNXUiwspoMDVoNzQ+JcSLPF9q5A56meCKbeZYFw54Z7o8cONfz4crK+2w00
	/OYnE6pwgUV8qEK2fr3ada9tJJbefb0BZMJ+6nypE=
X-Gm-Gg: AYBFou2euJuxlw+meLWEMqGf5eTeyeod8plHq7MZnqPE1g78R150aEsKAr3ORB1pkG/
	kbJ5pPee76vLdX3U9NpmCcsyxUR+4MFqj21UcdC1bLrDeMqCe9Udbj+Rc8952gAIsTb794E8eUs
	F0SwPrwP881XcNRjplTrmZhyHplR1vhOQ1m+6iK9HTQUdVPlfVtNS/0RylAqJStRALvIFuBMWyn
	sMtIbRHV80CSs79JyPPd0KQVBVG/x3bQg2KVs5jrQYcH3g9jZHwGPJg8cPHNbPnJD8ocmUKoM2/
	+xAxDODgBIICk9X2tm8pXfUrgbrq
X-Received: by 2002:a05:620a:468a:b0:93f:17e6:6ee2 with SMTP id af79cd13be357-94421585e5bmr2998714485a.6.1793822182550;
        Wed, 04 Nov 2026 11:56:22 -0800 (PST)
X-Received: by 2002:a05:620a:468a:b0:93f:17e6:6ee2 with SMTP id
 af79cd13be357-94421585e5bmr2998710085a.6.1793822182093; Wed, 04 Nov 2026
 11:56:22 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030-hawi-maili-camss-v3-0-9742bca8cef2@oss.qualcomm.com>
 <fFfGGWaoXA-LdO6s8Xh_kQWQfncXe9YNdpcj2yNkphWHAR_V69LdLOcuhXPsbg8dEUSN4j4yygq4wPre5cz79w==@protonmail.internalid>
 <20261030-hawi-maili-camss-v3-5-9742bca8cef2@oss.qualcomm.com>
 <5817be6b-7180-407b-acb5-8c5fdef4edfb@kernel.org> <73b1f591-69cf-471b-9763-a0b719c74501@oss.qualcomm.com>
 <fac8cd6d-c3f7-4ed3-b0d4-7cb8a7a6f451@linaro.org> <d92a8aaa-5cef-4416-b1c9-46ecfc6b2745@oss.qualcomm.com>
 <CAFEp6-3ka3ZKzCoLQ5BNv0YR+yhYXVRwV6G6rM8Lx_9hZ0RqVw@mail.gmail.com> <7acf1f64-a2ac-411d-a235-69ea52231623@linaro.org>
In-Reply-To: <7acf1f64-a2ac-411d-a235-69ea52231623@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 20:56:10 +0100
X-Gm-Features: AclHuK9iS-SlJNui77YNFKE0lYus5bUHSbzooakg4b1KhZgza0So8ebhpAkDmh8
Message-ID: <CAFEp6-0O3PyyytNvAUdvMRaMR3Q1Acb7KZmJmDT2J-gVfjYbsA@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] media: qcom: camss: Add support for Hawi
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA3OSBTYWx0ZWRfX2T7FYgNwtlRw
 3RQEH++8hXnQ9BzrQGd43O+igPmArMV97Q8+HLkI7+7l+NgwY9fAXZvapysKfs5kHzkviVdQTs+
 jnCJ088V49I9a+KZ8RiC09ThGMWzwDlXixMU3L4gzdxvEWi5l07blLBVVVX/hJZ+LVPgv8OZCb/
 axXyrxQYme2Hvcu1t29nFdD/owUP74h2h0mfu0X8KWvJcAQ6s7v/j1/L0J3v3sLIU6R3X0Rf6C7
 hO9eG36PPcmjjVOXrKZrIutUjS+8RkGhtMSnuYd18xJYnQ0kxAFz5BCC646BRURK2wETwzhi3Yd
 y9867AXQw4rfZe34GHzXA4/8TqQxjVZZiumAjMVwjwbRAVFxM4aDo7GJsQXtzMHrl0/eeqpauzj
 dTerF6o3o9uv0qsqCBqNoNedzGPGG2qQ9R1qQbjqbn7S/E8t33J1X9CtbVWJcPUyV4kbv+eFhdH
 hHT7w7CogmjPtjvvNeA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA3OSBTYWx0ZWRfXyC+9v8BapQmp
 y95RVTOlzkS6KeNLP4Z0aSK1teM4CVMxh0tSyoJMHTKWR4wW5dxSn91jImRKwDzKFIgfEo5gGEO
 YPHtBY0cW+mnj87oTrqOha29BoyxqHA=
X-Proofpoint-ORIG-GUID: JoH8-gIAcSrD6TMGJtKvuimBPj-9L9Hq
X-Proofpoint-GUID: JoH8-gIAcSrD6TMGJtKvuimBPj-9L9Hq
X-Authority-Analysis: v=2.4 cv=N/u8hG9B c=1 sm=1 tr=0 ts=6aeb8de7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=NEAV23lmAAAA:8 a=KKAkSRfTAAAA:8
 a=oDkJ1FRbrV4SKMjXgYUA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040079

On Wed, Nov 4, 2026 at 5:17=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 04/11/2026 16:11, Loic Poulain wrote:
> >>> We have a series from Antans to address this though.
> >>>
> >>> We should list the clocks the SoC supports not constrain that list fo=
r
> >>> one specific sensor on a test-case.
> >>>
> >>> ---
> >>> bod
> >> Good to know that Antans has a series addressing this. I agree that we
> >> should list all the clock rates supported by the SoC rather than
> >> constraining them for a specific sensor.
> >>
> >> One additional concern: if the clock selection logic still always pick=
s
> >> freq[0], listing a lower rate first could leave CAMSS unable to work
> >> properly with sensors that need higher bandwidth.
> >>
> >> Could you please share the link to the series? I'll rebase the next
> >> revision on top of it.
> > I don't think Atanas' series targets the CSID clocks, only the VFE
> > clocks. Ideally, we should make similar changes for the CSID clocks as
> > well, but for now they are not being considered here.
> >
> > Perhaps add a few comments documenting the supported rates and use a
> > single rate for the time being. Once the CSID clock changes land, we
> > should be able to revisit and adapt this accordingly?
>
> Its the same principle though.
>
> I don't think there's a valid case to exclude clock-rates purely because
> one sensor requires the higher rate and we aren't willing to do the work
> to make the clocks smarter.

Ok, fair enough.

Nihal, feel free to test & pick the following CSID clock scaling
support in your series, and add all the supported rates:
https://github.com/loicpoulain/linux/commit/a02dad23d219de1daa53e4095eb5289=
e5b5a6a15

Regards,
Loic
